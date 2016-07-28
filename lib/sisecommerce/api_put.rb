module Sisecommerce
  module APIPut
    module ClassMethods
      def put(store_name, api_token, data = nil)
        data ||= {}
        Request.send_request('PUT', store_name, api_token, "#{resource_name_pluralized}", data) if data.is_a? Hash
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
