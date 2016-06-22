require 'sisecommerce'

RSpec.configure do |config|
  config.order = "random"

  config.before(:each) do
    allow(Sisecommerce).to receive(:api_token).and_return('')
    allow(Sisecommerce).to receive(:store_name).and_return('')
  end
end
