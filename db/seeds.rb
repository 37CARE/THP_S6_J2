# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

print "clear User:"
User.destroy_all
puts " ✔"
print "clear Event:"
Event.destroy_all
puts " ✔"

10.times do
  user = User.create!(
                      first_name: Faker::Name.first_name, 
                      last_name: Faker::Name.last_name,
                      email: Faker::Name.first_name + "@yopmail.com",
                      description: Faker::Quote.famous_last_words,
                      password: "password"
                      )
end

10.times do
  user = Event.create!(
                      start_date: Faker::Date.between(1.days.from_now, 15.days.from_now),
                      duration: 60,
                      title: Faker::Lorem.sentence(2),
                      description: Faker::Lorem.sentence(15),
                      price: 100,
                      location: "Toulouse",
                      administrator: User.all.sample
                      )
end
