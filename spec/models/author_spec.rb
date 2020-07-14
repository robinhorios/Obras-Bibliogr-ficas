require 'rails_helper'

RSpec.describe Author, type: :model do
  subject { 
    described_class.new(
      first_name: 'Robinson Rios da', 
      last_name: 'SILVA', 
      formatted_name: 'SILVA, Robinson Rios da'
    ) 
  }

  describe 'Validations' do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a present_value" do
      subject.first_name, subject.last_name = nil
      expect(subject).to_not be_valid
    end
  end

  context 'when receive a valid list of author names' do
    let(:params) {
      [
        {first_name: "",         last_name: "JOHN",       formatted_name: "JOHN"}, 
        {first_name: "João",     last_name: "SILVA",      formatted_name: "SILVA, João"}, 
        {first_name: "João",     last_name: "NETO",       formatted_name: "NETO, João"}, 
        {first_name: "Paulo",    last_name: "COELHO",     formatted_name: "COELHO, Paulo"}, 
        {first_name: "Celso de", last_name: "ARAUJO",     formatted_name: "ARAUJO, Celso de"}, 
        {first_name: "João",     last_name: "SILVA NETO", formatted_name: "SILVA NETO, João"}
      ]
    }

    it 'creating the authors' do
      Author.create(params)
      expect(Author.all.size).to eq(6)
    end
  end
end