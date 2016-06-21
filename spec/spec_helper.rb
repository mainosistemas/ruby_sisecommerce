require 'sisecommerce'

RSpec.configure do |config|
  config.order = "random"

  config.before(:each) do
    allow(Sisecommerce).to receive(:token_api).and_return('testtoken')
    allow(Sisecommerce).to receive(:store_name).and_return('teststore')
  end
end
