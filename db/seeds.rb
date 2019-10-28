# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PrivateMessage.destroy_all
Subject.destroy_all
Tag.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all

10.times do
  City.create(name: Faker::Address.city, zip_code: Faker::Number.number(digits: 5).to_s)
end

10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Quote.yoda, email: Faker::Internet.email, age: rand(18..116), city: City.all.sample)
  Tag.create(title: Faker::Hacker.noun)
end

20.times do
  Gossip.create(title: Faker::Hacker.noun, content: Faker::Hacker.say_something_smart, user: User.all.sample)
end

20.times do 
  Subject.create(name: Faker::Hacker.verb, tag: Tag.all.sample, gossip: Gossip.all.sample)
end

5.times do
  PrivateMessage.create(content: Faker::ChuckNorris.fact, sender: User.all.sample, recipient: User.all.sample)
end
