class User < ApplicationRecord
  # Authentication
  has_secure_password
  # Validations
  validates :username, :email, presence: true, uniqueness: true
  
  # Relationships
  has_many :reviews, dependent: :destroy

  # Allows users to select favourites
  has_many :favourites, dependent: :destroy
  has_many :locations, through: :favourites
end
