class Location < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :acilities
end
