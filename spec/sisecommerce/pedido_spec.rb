RSpec.describe Sisecommerce::Pedido do
  describe '#all' do
    context 'having 10 pedidos available' do
      it 'lists pedidos available' do
        pedidos = Sisecommerce::Pedido.all
        expect(pedidos.size).to eq 10
      end

      it 'lists pedidos available by page' do
        pedidos = Sisecommerce::Pedido.all(page: 1)
        expect(pedidos.size).to eq 10
      end

      it 'lists pedidos between data_pedido' do
        pedidos = Sisecommerce::Pedido.all(data_pedido: '20160101-20160105')
        expect(pedidos.size).to eq 10
      end

      it 'lists pedidos by status' do
        pedidos = Sisecommerce::Pedido.all(status: 200)
        expect(pedidos.size).to eq 10
      end
    end

    context 'having no pedidos available' do
      it 'returns error 220' do
        pedidos = Sisecommerce::Pedido.all
        expect(pedidos.first['codigo']).to eq 220
      end
    end

  end

  describe '#find' do
    subject { pedidos = Sisecommerce::Pedido.find(10) }

    it 'should list pedido with id 10' do
      expect(subject.first['id']).to eq 10
    end
  end

  describe '#update' do
    let(:pedido) { Sisecommerce::Pedido.update(10, nome: 'new name') }

    it 'should change pedido nome' do
      expect(subject.first['nome']).to eq 'new name'
    end
  end

end
