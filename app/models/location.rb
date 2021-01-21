class Location < ApplicationRecord
  has_many :comments
  has_many :location_facilities
end
