# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    association :location, factory: :location
    association :user, factory: :user
    sequence :body do |n|
      "test body #{n}"
    end
    rating { 4 }
    trait :invalid do
      rating { 6 }
      body { nil }
    end
  end
end
