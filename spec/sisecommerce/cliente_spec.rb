RSpec.describe Sisecommerce::Cliente do
  describe '#get' do
    context 'having 10 clientes available' do
      it 'returns cliente with id 1' do
        clientes = Sisecommerce::Cliente.get(id: 1)
        expect(clientes.first.id).to eq 1
      end

      it 'lists clientes available' do
        clientes = Sisecommerce::Cliente.get
        expect(clientes.size).to eq 10
      end

      it 'lists clientes available by pagina' do
        clientes = Sisecommerce::Cliente.get(pagina: 1)
        expect(clientes.size).to eq 10
      end

      it 'lists clientes between data_cadastro' do
        clientes = Sisecommerce::Cliente.get(data_cadastro: '20160101-20160105')
        expect(clientes.size).to eq 10
      end

      it 'lists clientes by tipo_pessoa' do
        clientes = Sisecommerce::Cliente.get(tipo_pessoa: 'F')
        expect(clientes.size).to eq 10
      end
    end

    context 'having no clientes available' do
      it 'returns error 220' do
        retorno = Sisecommerce::Cliente.get
        expect(retorno.first.codigo).to eq 220
      end
    end
  end

end
