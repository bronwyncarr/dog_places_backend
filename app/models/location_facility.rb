class LocationFacility < ApplicationRecord
  has_many :locations
  has_many :facilities
end
