module Sisecommerce
  class Produto
    include Sisecommerce::APIResource
    include Sisecommerce::APIGet
    include Sisecommerce::APIPut
  end
end
