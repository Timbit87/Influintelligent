# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Collaboration.destroy_all
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

User.create!(
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

User.create!(
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

puts 'Creating collaborations...'

category = ['Fashion', 'Beauty', 'Lifestyle', 'Travel', 'Food', 'Fitness', 'Tech', 'Art', 'Music', 'Sports']

user = [brand1, brand2]

10.times do
  Collaboration.create!(
    title: Faker::Marketing.buzzwords,
    description: Faker::Lorem.paragraph(sentence_count: 20),
    price: Faker::Commerce.price(range: 10.0..500.0),
    category: category.sample(3),
    start_date: Faker::Date.between(from: '2024-07-01', to: '2024-12-31'),
    end_date: Faker::Date.between(from: '2024-08-01', to: '2025-01-31'),
    user_id: user.sample.id
  )
end

puts 'Collaborations created successfully!'