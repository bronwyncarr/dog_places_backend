# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
new_users = [{ name: 'steve', email: 'steve@s.com', password: '123456' },
             { name: 'Jess', email: 'Jessica@j.com', password: 'Password' }]

location_facilities = ['Toilets', 'Food', 'Parking', 'Water', 'Off Lead']

new_users.each do |user|
  User.create(name: user[:name], email: user[:email], password_digest: user[:password])
  puts "created #{user[name]} User"
end

location_facilities.each do |fac|
  Facility.create(name: fac)
  puts "created #{fac} facility"
end
