RSpec.describe Sisecommerce::Produto do
  describe '#get' do
    context 'having 10 produtos available' do
      it 'returns produto with id 1' do
        produtos = Sisecommerce::Produto.get(id: 1)
        expect(produtos.first.id).to eq 1
      end

      it 'returns produto with id_sku 1' do
        produtos = Sisecommerce::Produto.get(id_sku: 1)
        expect(produtos.first.id_sku).to eq 1
      end

      it 'lists produtos available' do
        produtos = Sisecommerce::Produto.get
        expect(produtos.size).to eq 10
      end

      it 'lists clientes available by pagina' do
        clientes = Sisecommerce::Cliente.get(pagina: 1)
        expect(clientes.size).to eq 10
      end
    end

    context 'having no produtos available' do
      it 'returns error 220' do
        retorno = Sisecommerce::Produto.get
        expect(retorno.first.codigo).to eq 220
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
