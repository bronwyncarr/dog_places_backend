require 'rails_helper'

RSpec.describe "Favourites", type: :request do
  before(:example) do
    @first_favourite = FactoryBot.create(:favourite)
    @second_favourite = FactoryBot.create(:favourite)
    get favourites_path
    @json_response = JSON.parse(response.body)
    it 'returns HTTP status 201' do
    expect(response).to have_http_status(201)
    end
  end
end
