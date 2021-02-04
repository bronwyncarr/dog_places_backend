# frozen_string_literal: true

# This will guess the User class
FactoryBot.define do
  factory :user do
    username { 'John' }
    email { 'Doe@d.com' }
    password { 'password' }
    is_admin { false }
  end
end
