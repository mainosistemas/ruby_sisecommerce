RSpec.describe Sisecommerce::Cliente do
  describe '#all' do
    subject { clientes = Sisecommerce::Cliente.all }

    context 'having 10 clientes available' do
      it 'lists clientes available' do
        expect(subject.size).to eq 10
      end
    end

    context 'having no clientes available' do
      it 'returns error 220' do
        expect(subject.first.codigo).to eq 220
      end
    end

  end

  describe '#find' do
    subject { clientes = Sisecommerce::Cliente.find(10) }

    it 'should list cliente with id 10' do
      expect(subject.first.id).to eq 10
    end
  end

  describe '#update' do
    let(:cliente) { Sisecommerce::Cliente.update(10, nome: 'new name') }

    it 'should change cliente nome' do
      expect(subject.first.nome).to eq 'new name'
    end
  end

end
