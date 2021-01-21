class User < ApplicationRecord
  has_one :Role
  
  has_many :comments
  has_many :locations
  
end
