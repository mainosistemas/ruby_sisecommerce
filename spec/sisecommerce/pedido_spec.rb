RSpec.describe Sisecommerce::Pedido do
  describe '#get' do
    context 'having 10 pedidos available' do
      it 'lists pedidos available' do
        pedidos = Sisecommerce::Pedido.get({})
        expect(pedidos.size).to eq 10
      end

      it 'should list pedido with id 10' do
        pedidos = Sisecommerce::Pedido.get(id: 10)
        expect(pedidos.first.id).to eq 10
      end

      it 'lists pedidos available by pagina' do
        pedidos = Sisecommerce::Pedido.get(pagina: 1)
        expect(pedidos.size).to eq 10
      end

      it 'lists pedidos between data_pedido' do
        pedidos = Sisecommerce::Pedido.get(data_pedido: '20160101-20160105')
        expect(pedidos.size).to eq 10
      end

      it 'lists pedidos by status' do
        pedidos = Sisecommerce::Pedido.get(status: 200)
        expect(pedidos.size).to eq 10
      end
    end

    context 'having no clientes available' do
      it 'returns error 220' do
        retorno = Sisecommerce::Pedido.get
        expect(retorno.first.codigo).to eq 220
      end
    end
  end
end
