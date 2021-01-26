class User < ApplicationRecord
  # Validations
  validates :username, :email, presence: true
  
  # Relationships
  has_many :comments, dependent: :destroy

  # Allows users to select favourites
  has_many :favourites, dependent: :destroy
  has_many :locations, through: :favourites
end
