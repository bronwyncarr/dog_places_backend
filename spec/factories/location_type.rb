# frozen_string_literal: true

FactoryBot.define do
  factory :location_type do
    sequence :name do |n|
      "location number #{n}"
    end
    trait :invalid do
      name { nil }
    end
  end
end
