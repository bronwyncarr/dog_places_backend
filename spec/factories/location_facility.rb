FactoryBot.define do 
  factory :location_facility do
    association :location, factory: :location
    association :facility, factory: :facility
 
  end
end
