RSpec.describe Authors::NameFormatter do
  describe '.call' do
    let(:author_names) {
      [
        'Robinson Rios da Silva',
        'Nubank Inter da Silva',
        'Bradesco Santander do Itaú Junior'
      ]
    }

    it 'returns an array with formatted names' do
      formatted_names = described_class.call(author_names)

      expect(formatted_names.first[:formatted_name]).to eq('SILVA, Robinson Rios da')
      expect(formatted_names.second[:formatted_name]).to eq('SILVA, Nubank Inter da')
      expect(formatted_names.third[:formatted_name]).to eq('ITAÚ JUNIOR, Bradesco Santander do')
    end
  end
end