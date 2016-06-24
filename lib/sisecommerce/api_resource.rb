module Sisecommerce
  module APIResource
    module ClassMethods
      def resource_name
        name.split('::').last.downcase
      end

      def resource_name_pluralized
        "#{resource_name}s"
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
