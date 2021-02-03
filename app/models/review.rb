# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :location
  validates :body, presence: true, allow_blank: false # needs to have some text input
  validates :rating, presence: true, allow_blank: false
  validates :rating, numericality: { greater_than:0, less_than_or_equal_to:5}
end
