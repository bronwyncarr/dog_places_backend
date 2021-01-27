class Location < ApplicationRecord
  # Validations
<<<<<<< HEAD
  validates :name, :location_type, :address, presence: true

  validates :description, length: { maximum: 5000 },presence: :true

  # Relationships
=======
  validates :name, presence: true
  validates :description, length: { maximum: 5000 }

  # Relationships
  has_many :comments, dependent: :destroy
>>>>>>> 39032d97d2bd43556339f763a1ee45e1ce759536
  belongs_to :location_type
  
  has_many :reviews, dependent: :destroy
  # Allows many facilities to be listed for each location
  has_many :location_facilities, dependent: :destroy
  has_many :facilities, through: :location_facilities

  # Allows users to select favourites
  has_many :favourites, dependent: :destroy
  has_many :users, through: :favourites

  # Geocoding goodness
  geocoded_by :address
  after_validation :geocode
end
