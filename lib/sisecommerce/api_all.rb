module Sisecommerce
  module APIAll
    module ClassMethods
      def all(page = nil)
        Request.send('GET', all_url)
      end

      def all_url
        "#{Sisecommerce.base_uri}#{self.url}"
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
