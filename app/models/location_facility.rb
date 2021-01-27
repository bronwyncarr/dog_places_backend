class LocationFacility < ApplicationRecord
  belongs_to :facility
  has_many :locations
end
