# frozen_string_literal: true

class Favourite < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :location
  # the user and location must exist otherwise it just plain doesnt make sense
  validates :user, uniqueness: { scope: [:location_id] }
  validates :location, uniqueness: { scope: [:user_id] }
end
