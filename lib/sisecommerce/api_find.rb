module Sisecommerce
  module APIFind
    module ClassMethods
      def find(id)
        Request.send_request('GET', self.url, {id: id})
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
