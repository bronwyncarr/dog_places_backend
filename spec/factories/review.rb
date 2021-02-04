FactoryBot.define do
  factory :review do
    association :location, factory: :location
    association :user, factory: :user

    body {" testing this out"}
    rating {4}
  end
end
