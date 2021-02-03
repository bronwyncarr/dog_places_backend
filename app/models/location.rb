# frozen_string_literal: true

class Location < ApplicationRecord
  # Geocoding goodness
  geocoded_by :address
  after_validation :geocode
  # Validations
  validates :name, :location_type, :address, presence: true

  validates :description, length: { maximum: 5000 }, presence: true

  # Relationships
  belongs_to :location_type
 
  has_many :reviews, dependent: :destroy
  # Allows many facilities to be listed for each location
  has_many :location_facilities, dependent: :destroy
  has_many :facilities, through: :location_facilities

  # Image uploading
  has_many_attached :images
  # Allows users to select favourites
  has_many :favourites, dependent: :destroy

  # nested location facilities config
  accepts_nested_attributes_for :location_facilities, allow_destroy: true, reject_if: lambda { |attr|
                                                                                        attr['name'].blank?
                                                                                      }
                                                                                     
 

  # Favorites integration
  def favorite?(user)
    !!favourites.find { |favorite| favorite.user_id == user.id }
  end

  

end
