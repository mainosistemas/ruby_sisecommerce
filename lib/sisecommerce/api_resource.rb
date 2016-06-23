module Sisecommerce
  module APIResource
    module ClassMethods
      def resource_name
        name.split('::').last.downcase
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
