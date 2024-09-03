include ActionView::Helpers::NumberHelper

User.destroy_all

puts 'Creating brands.. '

bear = User.create!(
  email: 'brand1@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: "Yogi",
  last_name: "Bear",
  brand_name: "Noboribetsu BearPark",
  brand: true,
  website: "www.bearpark.jp",
  social_links: { twitter: Faker::Internet.url, facebook: Faker::Internet.url, instagram: Faker::Internet.url, youtube: Faker::Internet.url, tiktok: Faker::Internet.url},
  availability: Date.today,
  about: "RAWR RAWR RAWRRRRRR...RAAAWWWWWWWWWRRRRR",
  tags: [Faker::Lorem.word, Faker::Lorem.word],
)
file = URI.open("https://res.cloudinary.com/du06tj0o3/image/upload/v1722061706/development/d7dahiz0y4iodj6a4w40eairnibv.jpg")

bear.avatar.attach(io: file,
  filename: "bear_profile",
  content_type: "image/jpg")
  bear.save

  domino = User.create!(
  email: 'brand2@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: "Domino Pizza",
  last_name: "Marketing team",
  brand: true,
  website: Faker::Internet.url,
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
  website: Faker::Internet.url,
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
  website: Faker::Internet.url,
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
  website: Faker::Internet.url,
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
  website: Faker::Internet.url,
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
  first_name: 'MrBeast',
  brand: false,
  website: Faker::Internet.url,
  social_links: {
    twitter: 'MrBeast',
    instagram: "mrbeast",
    tiktok: 'mrbeast',
    youtube: 'mrbeast6000'
  },
  availability: Date.today,
  about: Faker::Lorem.paragraph,
  tags: ['Game', "Tech"],
)

influencer2 = User.create!(
  email: 'influencer2@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Pewdiepie',
  brand: false,
  website: Faker::Internet.url,
  social_links: {
    twitter: 'pewdiepie',
    instagram: "pewdiepie",
    tiktok: 'pewdiepie',
    youtube: 'pewdiepie'
  },
  availability: Date.today,
  about: Faker::Lorem.paragraph,
  tags: ['Game'],
)

influencer3 = User.create!(
  email: 'influencer3@mail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'kylie',
  last_name: 'jenner',
  brand: false,
  website: Faker::Internet.url,
  social_links: {
    twitter: 'kyliejenner',
    instagram: "kyliejenner",
    tiktok: 'kyliejenner',
    youtube: 'kyliejenner'
  },
  availability: Date.today,
  about: Faker::Lorem.paragraph,
  tags: ['Beauty'],
)

puts 'Brands and Influencers created!'

Collaboration.destroy_all

puts 'Creating Collab.....'

collab1 = Collaboration.create!(
  title: "Bear Park Marketing",
  description: "We have manufactured brand new functional sneakers and we're looking for an infliencer to work with!",
  price: 100000,
  category: ["Sports"],
  start_date: DateTime.new(2024,7,1,17),
  end_date: DateTime.new(2024,9,1,17),
  user: bear
)

collab2 = Collaboration.create!(
  title: "Domino Pizza Campaign",
  description: "Looking for partner to work with our new summer pizza campaign!",
  price: 200000,
  category: ["Food"],
  start_date: DateTime.new(2024,8,1,17),
  end_date: DateTime.new(2024,10,1,17),
  user: domino
)

collab3 = Collaboration.create!(
  title: "Sanrio campaign",
  description: "Who wants to with with Hello Kitty!?",
  price: 300000,
  category: ["Toy"],
  start_date: DateTime.new(2024,8,1,17),
  end_date: DateTime.new(2024,10,1,17),
  user: sanrio
)

collab4 = Collaboration.create!(
  title: "Sega campaign",
  description: "We developed a new game and want to find a partner to work with for our campaign",
  price: 500000,
  category: ["Game"],
  start_date: DateTime.new(2024,8,1,17),
  end_date: DateTime.new(2024,10,1,17),
  user: sega
)

collab5 = Collaboration.create!(
  title: "Dell campaign",
  description: "Invented new device looking for awesome influencer to promote our device!",
  price: 600000,
  category: ["Electronic"],
  start_date: DateTime.new(2024,8,1,17),
  end_date: DateTime.new(2024,10,1,17),
  user: dell
)

collab6 = Collaboration.create!(
  title: "Kokuyo campaign",
  description: "We created new awesome pencils. We are looking for an influencer who has loves pencils!",
  price: 100000,
  category: ["Stationary"],
  start_date: DateTime.new(2024,8,1,17),
  end_date: DateTime.new(2024,10,1,17),
  user: kokuyo
)

puts "Collaboration created!"

Submission.destroy_all
puts 'Creating Submission.....'

Submission.create!(
  user: influencer1,
  collaboration: collab1,
  status: :confirmed
)

Submission.create!(
  user: influencer1,
  collaboration: collab2,
  status: :confirmed
)

Submission.create!(
  user: influencer1,
  collaboration: collab3,
  status: :confirmed
)

Submission.create!(
  user: influencer2,
  collaboration: collab4,
  status: :confirmed
)

Submission.create!(
  user: influencer2,
  collaboration: collab5,
  status: :confirmed
)

Submission.create!(
  user: influencer2,
  collaboration: collab6,
  status: :confirmed
)

Submission.create!(
  user: influencer3,
  collaboration: collab1,
  status: :confirmed
)

Submission.create!(
  user: influencer3,
  collaboration: collab2,
  status: :confirmed
)

Submission.create!(
  user: influencer3,
  collaboration: collab3,
  status: :confirmed
)

puts "Submission created!"
