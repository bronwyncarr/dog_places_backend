# frozen_string_literal: true

class LocationFacility < ApplicationRecord
  belongs_to :facility
  belongs_to :location
end
