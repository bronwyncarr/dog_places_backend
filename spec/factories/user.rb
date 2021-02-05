# frozen_string_literal: true

# This will guess the User class
FactoryBot.define do
  factory :user do
    sequence :username do |n|
      " test user #{n}"
    end
    sequence :email do |n|
      "testemail#{n}@test.com"
    end
    password { 'password' }
    is_admin { false }
    trait :invalid do
      email { '123456' }
    end
    trait :admin do
      is_admin { true }
    end
  end
end
