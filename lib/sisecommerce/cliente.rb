module Sisecommerce
  class Cliente
    include Sisecommerce::APIAll
    include Sisecommerce::APIFind

    def self.url
      "#{Sisecommerce.base_uri}clientes"
    end
  end
end
