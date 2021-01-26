class Facility < ApplicationRecord
   # Validations
   validates :name, presence: true

  # Allows many facilities to be listed for each location
  has_many :location_facilities, dependent: :destroy
  has_many :locations, through: :location_facilities
end
