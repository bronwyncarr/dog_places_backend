# frozen_string_literal: true

FactoryBot.define do
  factory :location_facility do
    association :location, factory: :location
    association :facility, factory: :facility
    trait :invalid do
      location_id { nil }
    end
  end
end
