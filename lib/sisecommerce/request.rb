require 'rest_client'

module Sisecommerce
  class Request
    def self.send(method, url, data = {})
      p build_request(method, url, data)
      RestClient::Request.execute build_request(method, url, data)
    end

    def self.build_request(method, url, data)
      {
        headers: default_headers,
        method: method,
        payload: data.to_json,
        url: url,
        timeout: 30
      }
    end

    def self.default_headers
      {
        authorization: 'Basic ' + "#{Sisecommerce.store_name}:#{Sisecommerce.api_token}",
        accept: 'application/json',
        accept_charset: 'utf-8',
        accept_language: 'pt-br;q=0.9,pt-BR',
        content_type: 'application/json; charset=utf-8'
      }
    end

  end
end
