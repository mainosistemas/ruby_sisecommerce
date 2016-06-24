RSpec.describe Sisecommerce::Produto do
  describe '#get' do
    context 'having 10 produtos available' do
      it 'lists produtos available' do
        produtos = Sisecommerce::Produto.get
        expect(produtos.size).to eq 10
      end

      it 'returns produto with specific id' do
        produtos = Sisecommerce::Produto.get(id: 1)
        expect(produtos.first.id).to eq 1
      end

      it 'returns produto with specific id_sku' do
        produtos = Sisecommerce::Produto.get(id_sku: 1)
        expect(produtos.first.id_sku).to eq 1
      end

      it 'lists produtos available by pagina' do
        produtos = Sisecommerce::Produto.get(pagina: 1)
        expect(produtos.size).to eq 10
      end
    end

    context 'having no produtos available' do
      it 'returns error 220' do
        retorno = Sisecommerce::Pedido.get
        expect(retorno.erros.first.codigo).to eq 220
      end
    end
  end

  describe '#put' do
    let(:produto_put) {  }

    it 'should change produto nome' do
      Sisecommerce::Produto.put(id_sku: 1, nome: 'new name')
      expect(Sisecommerce::Produto.get(id: 1).nome).to eq 'new name'
    end
  end

end
