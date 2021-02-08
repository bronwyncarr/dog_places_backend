RSpec.describe ReviewsController, type: :request do
  context 'Review post path' do
    before(:example) do
      
      @review =FactoryBot.attributes_for(:review)

      post reviews_path, params: { review: @review }, headers: authenticated_header

      @json_response = JSON.parse(response.body)
    end
    it('should return a status 422 without propper authentication') do
      expect(response).to have_http_status(422)
    end
    it('should return the right errors') do

      expect(@json_response.count).to eq(3)
    end
  end
end
