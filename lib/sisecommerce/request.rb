require 'rest_client'
require 'base64'
require 'json'

module Sisecommerce
  class RequestFailed < StandardError;end

  class Request
    def self.send_request(method, store_name, api_token, resource_name, data)
      validate_user_data(store_name, api_token)
      request = RestClient::Request.execute(build_request(method, store_name, api_token, resource_name, data))
      handle_response request, resource_name
    end

    def self.validate_user_data(store_name, api_token)
      unless store_name && api_token
        raise "API Token and Store name not given. Please, set Sisecommerce.api_token and Sisecommerce.store_name before sending requests."
      end
    end

    def self.url(store_name, resource_name)
      "http://#{store_name}.#{Sisecommerce.endpoint}#{resource_name}"
    end

    def self.handle_response(response, resource_name)
      JSON.parse(response, object_class: OpenStruct)
    rescue JSON::ParserError
      raise RequestFailed
    end

    def self.build_request(method, store_name, api_token, resource_name, data)
      if method == "PUT"
        build_put_request(store_name, api_token, resource_name, data)
      else
        build_get_request(store_name, api_token, resource_name, data)
      end
    end

    def self.build_put_request(store_name, api_token, resource_name, data)
      {
        headers: default_put_headers(store_name, api_token, data),
        method: "PUT",
        payload: data.to_json,
        url: url(store_name, resource_name),
        timeout: 30
      }
    end

    def self.default_put_headers(store_name, api_token, data)
      {
        authorization: "Basic #{authorization(store_name, api_token)}",
        accept: 'application/json',
        accept_charset: 'utf-8',
        accept_language: 'pt-br;q=0.9,pt-BR',
        content_type: 'application/json; charset=utf-8'
      }
    end

    def self.build_get_request(store_name, api_token, resource_name, data)
      {
        headers: default_get_headers(store_name, api_token, data),
        method: "GET",
        url: url(store_name, resource_name),
        timeout: 30
      }
    end

    def self.default_get_headers(store_name, api_token, data)
      {
        authorization: "Basic #{authorization(store_name, api_token)}",
        accept: 'application/json',
        accept_charset: 'utf-8',
        accept_language: 'pt-br;q=0.9,pt-BR',
        content_type: 'application/json; charset=utf-8',
        params: data
      }
    end

    def self.authorization(store_name, api_token)
      Base64.encode64("#{store_name}:#{api_token}").gsub("\n", "")
    end
  end
end
