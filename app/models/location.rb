class Location < ApplicationRecord
  belongs_to :user
  belongs_to :location_type

  has_many :comments
  #has_many :facilities through :location_facilities

  geocoded_by :address
  after_validation :geocode
end
