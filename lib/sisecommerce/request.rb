require 'rest_client'
require 'base64'
require 'json'

module Sisecommerce
  class Request
    def self.send_request(method, resource_name, data = {})
      validate_user_data
      request = RestClient::Request.execute(build_request(method, resource_name, data))
      handle_response request, resource_name
    end

    def self.validate_user_data
      unless Sisecommerce.api_token && Sisecommerce.store_name
        raise "API Token and Store name not given. Please, set Sisecommerce.api_token and Sisecommerce.store_name before sending requests."
      end
    end

    def self.url(resource_name)
      "#{Sisecommerce.base_uri}#{resource_name}"
    end

    def self.handle_response(response, resource_name)
      json_response = JSON.parse(response, object_class: OpenStruct)
      if json_response.retorno
        json_response.retorno
      else
        json_response.send(resource_name)
      end
    rescue JSON::ParserError
      raise RequestFailed
    end

    def self.build_request(method, resource_name, data)
      {
        headers: default_headers,
        method: method,
        payload: data,
        url: url(resource_name),
        timeout: 30
      }
    end

    def self.default_headers
      {
        authorization: "Basic #{authorization}",
        accept: 'application/json',
        accept_charset: 'utf-8',
        accept_language: 'pt-br;q=0.9,pt-BR',
        content_type: 'application/json; charset=utf-8'
      }
    end

    def self.authorization
      Base64.encode64("#{Sisecommerce.store_name}:#{Sisecommerce.api_token}").gsub("\n", "")
    end

  end
end
