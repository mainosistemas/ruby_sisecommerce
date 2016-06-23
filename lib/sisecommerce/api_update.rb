module Sisecommerce
  module APIUpdate
    module ClassMethods
      def update(data = {})
        Request.send_request('PUT', "#{resource_name}s", {data: data})
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
