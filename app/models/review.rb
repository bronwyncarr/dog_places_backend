class Review < ApplicationRecord
  belongs_to :user
  belongs_to :location
  validates :body, presence: true, allow_blank: false # needs to have some text input
  validates :rating, presence: true, allow_blank: false

end
