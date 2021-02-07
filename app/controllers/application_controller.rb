# frozen_string_literal: true

class ApplicationController < ActionController::API
  # good 'ol knock for auth
  include Knock::Authenticable
  def transform_json
    facility_array = get_facilities(self)
    {
      id: id,
      location_type_name: location_type.name,
      name: name,
      address: address,
      description: description,
      longitude: longitude,
      latitude: latitude,
      posted: created_at,
      edited: updated_at,
      reviews: reviews.map(&:get_reviews),
      faved: false,
      location_facilities_attributes: facility_array,
      google: Rails.application.credentials.dig(:google_maps, :api_key)
      
    }
end
