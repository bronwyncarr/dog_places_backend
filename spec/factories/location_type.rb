FactoryBot.define do
  factory :location_type do
   

    sequence :name do |n|
      "location number #{n}"
    end
  end
end
