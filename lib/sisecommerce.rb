require_relative 'sisecommerce/request'
require_relative 'sisecommerce/api_resource'
require_relative 'sisecommerce/api_get'
require_relative 'sisecommerce/api_put'
require_relative 'sisecommerce/cliente'
require_relative 'sisecommerce/pedido'
require_relative 'sisecommerce/produto'

module Sisecommerce
  class << self
    attr_accessor :api_token, :store_name
  end

  @endpoint = 'appsisecommerce.com.br/api/'

  def self.base_uri
    "http://#{store_name}.#{@endpoint}"
  end
end
