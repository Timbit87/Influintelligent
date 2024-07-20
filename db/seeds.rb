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

mizuno = User.create!(
  email: 'brand1@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: "Mizuno",
  last_name: "Marketing Team",
  brand: true,
  websites: [Faker::Internet.url],
  social_links: { twitter: Faker::Internet.url, facebook: Faker::Internet.url },
  availability: Date.today,
  about: Faker::Lorem.paragraph,
  tags: [Faker::Lorem.word, Faker::Lorem.word]
)
domino = User.create!(
  email: 'brand2@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: "Domino Pizza",
  last_name: "Marketing team",
  brand: true,
  websites: [Faker::Internet.url],
  social_links: { twitter: Faker::Internet.url, facebook: Faker::Internet.url },
  availability: Date.today,
  about: Faker::Lorem.paragraph,
  tags: [Faker::Lorem.word, Faker::Lorem.word]
)
sanrio = User.create!(
  email: 'brand3@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: "Sanrio",
  last_name: "Branding team",
  brand: true,
  websites: [Faker::Internet.url],
  social_links: { twitter: Faker::Internet.url, facebook: Faker::Internet.url },
  availability: Date.today,
  about: Faker::Lorem.paragraph,
  tags: [Faker::Lorem.word, Faker::Lorem.word]
)
sega = User.create!(
  email: 'brand4@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: "Sega",
  last_name: "Team",
  brand: true,
  websites: [Faker::Internet.url],
  social_links: { twitter: Faker::Internet.url, facebook: Faker::Internet.url },
  availability: Date.today,
  about: Faker::Lorem.paragraph,
  tags: [Faker::Lorem.word, Faker::Lorem.word]
)
dell = User.create!(
  email: 'brand5@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: "Dell",
  last_name: "PR",
  brand: true,
  websites: [Faker::Internet.url],
  social_links: { twitter: Faker::Internet.url, facebook: Faker::Internet.url },
  availability: Date.today,
  about: Faker::Lorem.paragraph,
  tags: [Faker::Lorem.word, Faker::Lorem.word]
)
kokuyo = User.create!(
  email: 'brand6@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: "Kokuyo",
  last_name: "Public Relation",
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
  description: "We manufactured brand new functional sneaker and looking for infliencer to work with!",
  price: 100,
  category: ["sports"],
  start_date: DateTime.new(2024,7,1,17),
  end_date: DateTime.new(2024,9,1,17),
  user: mizuno
)

domino = Collaboration.create!(
  title: "Domino Pizza Campaign",
  description: "Looking for partner to work with out new summer pizza campaign!",
  price: 200,
  category: ["food"],
  start_date: DateTime.new(2024,8,1,17),
  end_date: DateTime.new(2024,10,1,17),
  user: domino
)

sanrio = Collaboration.create!(
  title: "Sanrio campaign",
  description: "Who watns to with with hello kitty!?",
  price: 300,
  category: ["toy"],
  start_date: DateTime.new(2024,8,1,17),
  end_date: DateTime.new(2024,10,1,17),
  user: sanrio
)

sega = Collaboration.create!(
  title: "Sega campaign",
  description: "developed new game, want to find partner to work with for campaign",
  price: 500,
  category: ["game"],
  start_date: DateTime.new(2024,8,1,17),
  end_date: DateTime.new(2024,10,1,17),
  user: sega
)

dell = Collaboration.create!(
  title: "Dell campaign",
  description: "Invented new device looking for awesome influencer to promote our device!",
  price: 600,
  category: ["electronic"],
  start_date: DateTime.new(2024,8,1,17),
  end_date: DateTime.new(2024,10,1,17),
  user: dell
)

kokuyo = Collaboration.create!(
  title: "Kokuyo campaign",
  description: "We created new awesome pencil, looking for influencer who has background",
  price: 100,
  category: ["stationary"],
  start_date: DateTime.new(2024,8,1,17),
  end_date: DateTime.new(2024,10,1,17),
  user: kokuyo
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

Submission.create!(
  user: influencer1,
  collaboration: sanrio
)

Submission.create!(
  user: influencer1,
  collaboration: sega
)

Submission.create!(
  user: influencer2,
  collaboration: dell
)

Submission.create!(
  user: influencer1,
  collaboration: kokuyo
)


puts "Submission created!"
