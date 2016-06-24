RSpec.describe Sisecommerce::Pedido, :vcr do
  describe '#get' do
    context 'having 10 pedidos available' do
      it 'lists pedidos available' do
        resposta = Sisecommerce::Pedido.get()
        expect(resposta.pedidos.size).to eq 10
      end

      it 'returns pedido with specific ID' do
        resposta = Sisecommerce::Pedido.get(id: 12)
        expect(resposta.pedidos.first.id).to eq 12
      end

      it 'lists pedidos between data_pedido' do
        resposta = Sisecommerce::Pedido.get(data_pedido: '20160203-20160204')
        expect(resposta.pedidos.first.data).to include '2016-02-03'
      end

      it 'lists pedidos available by pagina' do
        resposta = Sisecommerce::Pedido.get(pagina: 1)
        expect(resposta.pedidos.size).to eq 10
      end

      it 'lists pedidos by status' do
        resposta = Sisecommerce::Pedido.get(status: 200)
        expect(resposta.pedidos.first.status_codigo).to eq 200
      end
    end

    context 'having no clientes available' do
      it 'returns error 220' do
        resposta = Sisecommerce::Pedido.get
        expect(resposta.retorno.erros.first.codigo).to eq 220
      end
    end
  end

  describe '#total_page' do
    it 'returns the total page number' do
      resposta = Sisecommerce::Pedido.total_page
      expect(resposta).to eq 2
    end
  end

  describe '#get_last' do
    it 'returns the last pedido created' do
      resposta = Sisecommerce::Pedido.get_last
      expect(resposta.pedidos.)
    end
  end
end
