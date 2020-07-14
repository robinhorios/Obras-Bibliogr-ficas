require "rails_helper"

RSpec.describe Author, type: :request do
  let(:author_params) {
    {
      author: {
        names: [
          'Celso de Araujo',
          'João da Silva Neto'
        ]
      }
    }
  }

  describe 'POST /api/v1/authors/' do
    before { post '/api/v1/authors', params: author_params }

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    it 'returns the number of authors created' do
      expect(Author.all.size).to eq(2)
      expect(Author.first.formatted_name).to eq('ARAUJO, Celso de')
      expect(Author.second.formatted_name).to eq('SILVA NETO, João da')
    end
  end
end