RSpec.describe Sisecommerce::Request do
  describe '#url' do
    subject { Sisecommerce::Request.url('clientes') }

    it 'should return the target url' do
      is_expected.to eq "http://#{Sisecommerce.store_name}.appsisecommerce.com.br/api/clientes"
    end
  end
end
