class Location < ApplicationRecord
  # Geocoding goodness
  geocoded_by :address
  after_validation :geocode
  # Validations
  validates :name, :location_type, :address, presence: true

  validates :description, length: { maximum: 5000 }, presence: :true

  # Relationships
  belongs_to :location_type
  belongs_to :user
  has_many :reviews, dependent: :destroy
  # Allows many facilities to be listed for each location
  has_many :location_facilities, dependent: :destroy
  has_many :facilities, through: :location_facilities

  # Image uploading
  has_many_attached :images
  # Allows users to select favourites
  has_many :favourites, dependent: :destroy
  has_many :users, through: :favourites

  # nested location facilities config
  accepts_nested_attributes_for :location_facilities, allow_destroy: true, reject_if: lambda { |attr|
                                                                                        attr['name'].blank?
                                                                                      }
def get_facilities(location)
  facilities = []
  location.location_facilities.each do |fac|
    facilities << fac.facility.name
  end
  facilities
end


  # Makes the JSON request easier to work with on the React side
  def transform_json
    {
      id: id,
      user: user.username,
      location_type: location_type.name,
      name: name,
      address: address,
      description: description,
      longitude: longitude,
      latitude: latitude,
      posted: created_at,
      edited: updated_at,
      reviews: self.reviews,
      facilities:get_facilities(self)
    }
  end

  # Favorites integration
  def favorite?(user)
    !!favourites.find { |favorite| favorite.user_id == user.id }
  end
end
