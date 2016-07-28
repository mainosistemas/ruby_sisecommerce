require_relative 'sisecommerce/request'
require_relative 'sisecommerce/api_resource'
require_relative 'sisecommerce/api_get'
require_relative 'sisecommerce/api_put'
require_relative 'sisecommerce/cliente'
require_relative 'sisecommerce/pedido'
require_relative 'sisecommerce/produto'

module Sisecommerce
  def self.endpoint
    'appsisecommerce.com.br/api/'
  end
end
