# This will guess the User class
FactoryBot.define do
  factory :user do
    username { "John" }
    email  { "Doe@d.com" }
    password {'password'}
    admin { false }
  end
end