# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

new_users = [{ name: 'steve', email: 'steve@s.com', password: '123456' },
  { name: 'Jess', email: 'Jessica@j.com', password: 'Password' }]
location_facilities = ['Toilets', 'Food', 'Parking', 'Water', 'Off Lead']

location_types = ['Dog park', 'Park', 'Beach', 'Dog Cafe']

if User.count == 0
  new_users.each do |user|
    User.create(username: user[:name], email: user[:email], password_digest: user[:password])
    puts "Created #{user[:name]} User"
  end
else
  puts 'User database already seeded'
end
if Facility.count == 0
  location_facilities.each do |fac|
    Facility.create(name: fac)
    puts "Created #{fac} facility"
  end
else
  puts 'Facility database already seeded'
end
if LocationType.count == 0
  location_types.each do |type|
    LocationType.create(name: type)
    puts "Created #{type} Location Type"
  end
else
  puts 'Location type database already seeded'
end
#Location.create(user:User.first,facility:Facility.first,location_type:LocationType.first,name:'test dog park',address:'655 Westernport Hwy',latitude:'-38.155520',longitude:'145.224080')

Location.create(user_id:1,location_type_id:1,name:'test dog park',address:'655 Westernport Hwy',description:'A fun dogpark for all to come and play!')
Location.create(user_id:1,location_type_id:4,name:'bunnings',address:'675/685 Warrigal Rd, Chadstone VIC 3148',description:'Dogs can come into the store on lead.')
Location.create(user_id:1,location_type_id:3,name:'Chelsea beach',address:'chelsea beach, chelsea, vic 3196',description:'Dogs can run off lead before 7am and after 6pm')

Favourite.create(user_id: 1, location_id: 1)
Favourite.create(user_id: 2, location_id: 1)

LocationFacility.create(facility_id: 1, location_id: 1)
LocationFacility.create(facility_id: 2, location_id: 1)
