# frozen_string_literal: true

FactoryBot.define do
  factory :favourite do
    association :location, factory: :location
    association :user, factory: :user
  end
end
