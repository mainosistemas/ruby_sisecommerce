require 'rest_client'
require 'base64'

module Sisecommerce
  class Request
    def self.send_request(method, url, data = {})
      p build_request(method, url, data)
      validate_user_data
      RestClient::Request.execute build_request(method, url, data)
    end

    def self.validate_user_data
      unless Sisecommerce.api_token && Sisecommerce.store_name
        raise "API Token and Store name not given. Please, set Sisecommerce.api_token and Sisecommerce.store_name before sending requests."
      end
    end

    def self.build_request(method, url, data)
      {
        headers: default_headers,
        method: method,
        payload: data,
        url: url,
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
