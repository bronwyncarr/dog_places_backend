# frozen_string_literal: true

class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :location
  validates :user, uniqueness: { scope: [:location_id] }
  
end
