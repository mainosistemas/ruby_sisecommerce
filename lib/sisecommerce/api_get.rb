module Sisecommerce
  module APIGet
    module ClassMethods
      def get(data = nil)
        Request.send_request('GET', "#{resource_name}s", {data: data}) if data.is_a? Hash
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
