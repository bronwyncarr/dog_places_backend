FactoryBot.define do
  factory :location do
    association :location_type, factory: :location_type
  

  sequence :name do |n|
  "location number #{n}"
  end
  address { '655 westernport highway' }
  description {"A fun dog park for all to come and play!"}
  end
end