# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

new_users = [{ username: 'steve', email: 'a@test.com', password: '123456' },
             { username: 'Jess', email: 'b@test.com', password: '123456' }]

new_users.each do |user|

  User.create(username: user[:username], email: user[:email], password_digest: user[:password])
  puts "Created #{user[:name]} User"
end

Location.create(user_id: 1, location_type_id: 1,name:'test dog park', description: "Great place with lots of off-lead areas" )

Favourite.create(user_id: 1, location_id: 1)
Favourite.create(user_id: 2, location_id: 1)


location_types = ['Dog park', 'Park', 'Beach', 'Dog Cafe']

location_types.each do |type|
  LocationType.create(name: type)
  puts "Created #{type} Location Type"
end

facilities = ['Toilets', 'Food', 'Parking', 'Water', 'Off Lead']

facilities.each do |fac|
  Facility.create(name: fac)
  puts "Created #{fac} facility"
end


LocationFacility.create(facility_id: 1, location_id: 1)
LocationFacility.create(facility_id: 2, location_id: 1)
