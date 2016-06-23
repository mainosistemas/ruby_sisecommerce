module Sisecommerce
  module APIPut
    module ClassMethods
      def put(data = nil)
        Request.send_request('PUT', "#{resource_name}s", {data: data}) if data.is_a? Hash
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
