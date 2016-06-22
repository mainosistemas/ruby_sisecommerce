RSpec.describe 'Sisecommerce::Clientes' do
  describe '#all' do
    subject { clientes = Sisecommerce::Cliente.all }

    it 'should list all clientes available' do
      is_expected.to_not be nil
    end

    it 'should return Cliente instances' do
      expect(subject.first).to be_a Cliente
    end
  end

  describe '#find' do
    subject { clientes = Sisecommerce::Cliente.find(10) }

    it 'should list cliente with id 10' do
      is_expected.to_not be nil
    end
  end

  describe '#update' do
    let(:cliente) { Sisecommerce::Cliente.update(10, nome: 'new name') }

    it 'should change cliente nome' do
      is_expected.to_not be nil
    end
  end

end
