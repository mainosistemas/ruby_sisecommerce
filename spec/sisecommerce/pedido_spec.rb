RSpec.describe Sisecommerce::Pedido, :vcr do
  describe '#get' do
    context 'having 10 pedidos available' do
      it 'lists pedidos available' do
        pedidos = Sisecommerce::Pedido.get()
        expect(pedidos.size).to eq 10
      end

      it 'returns pedido with specific ID' do
        pedidos = Sisecommerce::Pedido.get(id: 12)
        expect(pedidos.first.id).to eq 12
      end

      it 'lists pedidos between data_pedido' do
        pedidos = Sisecommerce::Pedido.get(data_pedido: '20160203-20160204')
        expect(pedidos.first.data).to include '2016-02-03'
      end

      it 'lists pedidos available by pagina' do
        pedidos = Sisecommerce::Pedido.get(pagina: 1)
        expect(pedidos.size).to eq 10
      end

      it 'lists pedidos by status' do
        pedidos = Sisecommerce::Pedido.get(status: 200)
        expect(pedidos.first.status_codigo).to eq 200
      end
    end

    context 'having no clientes available' do
      it 'returns error 220' do
        retorno = Sisecommerce::Pedido.get
        expect(retorno.erros.first.codigo).to eq 220
      end
    end
  end
end
