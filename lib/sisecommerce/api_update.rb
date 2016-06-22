module Sisecommerce
  module APIUpdate
    module ClassMethods
      def update(data = {})
        Request.send_request('PUT', self.url, {data: data})
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
