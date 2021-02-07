# frozen_string_literal: true

class Review < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :location
  # Vaildations
  validates :body, presence: true, allow_blank: false # needs to have some text input
  validates :rating, presence: true, allow_blank: false
  validates :rating, numericality: { greater_than: 0, less_than_or_equal_to: 5 }
  # image for the review to bedisplayed on the show page
  has_one_attached :image
end
