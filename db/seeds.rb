# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all

puts 'Creating brands.. '

brand1 = User.create!(
  email: 'brand1@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  brand: true,
  websites: [Faker::Internet.url],
  social_links: { twitter: Faker::Internet.url, facebook: Faker::Internet.url },
  availability: Date.today,
  about: Faker::Lorem.paragraph,
  tags: [Faker::Lorem.word, Faker::Lorem.word]
)
brand2 = User.create!(
  email: 'brand2@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  brand: true,
  websites: [Faker::Internet.url],
  social_links: { twitter: Faker::Internet.url, facebook: Faker::Internet.url },
  availability: Date.today,
  about: Faker::Lorem.paragraph,
  tags: [Faker::Lorem.word, Faker::Lorem.word]
)

puts 'Creating influencers..'

influencer1 = User.create!(
  email: 'influencer1@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  brand: false,
  websites: [Faker::Internet.url],
  social_links: { twitter: Faker::Internet.url, facebook: Faker::Internet.url },
  availability: Date.today,
  about: Faker::Lorem.paragraph,
  tags: [Faker::Lorem.word, Faker::Lorem.word]
)

influencer2 = User.create!(
  email: 'influencer2@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  brand: false,
  websites: [Faker::Internet.url],
  social_links: { twitter: Faker::Internet.url, facebook: Faker::Internet.url },
  availability: Date.today,
  about: Faker::Lorem.paragraph,
  tags: [Faker::Lorem.word, Faker::Lorem.word]
)

puts 'Brands and Influencers created!'

Collaboration.destroy_all

puts 'Creating Collab.....'

mizuno = Collaboration.create!(
  title: "Mizuno Marketing",
  description: "To collab with Mizuno",
  price: 100000,
  category: ["sports"],
  start_date: DateTime.new(2009,9,1,17),
  end_date: DateTime.new(2009,9,1,17),
  user: brand1
)

domino = Collaboration.create!(
  title: "Domino Pizza Campaign",
  description: "To collab with Domino",
  price: 200000,
  category: ["food"],
  start_date: DateTime.new(2009,9,1,17),
  end_date: DateTime.new(2009,9,1,17),
  user: brand2
)

puts "Collaboration created!"

Submission.destroy_all
puts 'Creating Submission.....'

Submission.create!(
  user: influencer1,
  collaboration: domino
)

Submission.create!(
  user: influencer2,
  collaboration: mizuno
)

puts "Submission created!"
