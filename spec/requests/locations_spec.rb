# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LocationsController, type: :request do
  describe 'location requests' do
    before(:example) do
      @first_location = FactoryBot.create(:location)
      @second_location = FactoryBot.create(:location)
      get location_path
      @json_response = JSON.parse(response.body)
      it 'returns HTTP status 201' do
      expect(response).to have_http_status(201)
      end
      it 'has the right number of entries'do 
      expect(@json_response['locations'].count).to eq(2)
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
        describe 'POST Locations#create' do
      context 'when the location is valid' do
        before(:example) do 
        @location_params = FactoryBot.attributes_for(:location)
        post locations_path, params: {location: location_params}
      end
        it 'returns a http status 201'
        expect(response).to have_http_status(201)
        end  
        it 'saves location to the database' do 
          expect(Location.last.id).to eq(@location_params) 
        end   
      end
      context ' when the location is invalid'do
      before(:example)  do
      @location_params= FactoryBot.attributes_for(:location, :invalid)
      post locations_path, params: {location: location_params}
        @json_respone = JSON.parse(response.body)
    end  
    it 'should return unprocessable entity'
    expect(response).to have_http_status(:unprocessable_entity)
    end
    end
  end
end
