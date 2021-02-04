# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LocationsController, type: :request do
  describe 'location requests' do
    before(:example) do
      @first_location = FactoryBot.create(:location)
      @second_location = FactoryBot.create(:location)
      get tasks_path
      @json_response = JSON.parse(response.body)
      it 'returns HTTP status 201' do
      expect(response).to have_http_status(201)
      end
      it 'has the right number of entries'do 
      expect(@json_response['locations'].count).to eq(2)
      end
      it 'routes to #show' do
        expect(get: '/api/locations/1').to route_to('locations#show', id: '1')
      end

      it 'routes to #create' do
        expect(post: '/api/locations').to route_to('locations#create')
      end

      it 'routes to #update via PUT' do
        expect(put: '/api/locations/1').to route_to('locations#update', id: '1')
      end

      it 'routes to #update via PUT' do
        expect(put: '/api/locations/1').to route_to('locations#update', id: '1')
      end
      it 'routes to #delete via delete' do
        expect(delete: '/api/locations/1').to route_to('locations#destroy', id: '1')
      end
    end
  end
end
