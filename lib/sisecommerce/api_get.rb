module Sisecommerce
  module APIGet
    module ClassMethods
      def get(data = nil)
        data ||= {}
        Request.send_request('GET', "#{resource_name_pluralized}", data) if data.is_a? Hash
      end

      def total_page
        get.total_paginas
      end

      def get_last_page
        get(pagina: total_page)
      end

      def get_last
        get_last_page[resource_name_pluralized].last
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
