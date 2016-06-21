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
end
