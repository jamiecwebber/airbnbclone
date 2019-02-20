# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require "json"
require "faker"
require "rest-client"

# Returns a string used as 'bio' in the user object.
def bio_generator
  url = 'https://api.adviceslip.com/advice'
  doc = URI.open(url).read
  api = JSON.parse(doc)
  result = api["slip"]["advice"]
end

# Generates an apartment that is run when you create a new host object.
def generate_appartment(id)
  host_id = id
  price_per_day = rand(20..500)
  category = ["arts", "sports", "science", "business"]
  name = Faker::Restaurant.name
  description = bio_generator # See line 15 for method definition
  location = "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.zip_code}"
  photos = "https://source.unsplash.com/collection/494266/1600x900?#{rand()}"

  new_appartment = Apartment.new({
    price_per_day: price_per_day,
    category: category[rand(0..3)],
    name: name,
    description: description,
    location: location,
    photos: photos,
    user_id: host_id
  })
  new_appartment.save
end

# Generates a booking and review for each non-apartment owning user
def generate_booking
  start_date = Time.now - rand(15552000)
  end_date = start_date + rand(100000..1000000)
  new_booking = Booking.new ({
    user_id: rand(55..95),
    apartment_id: rand(1..45),
    price_total: rand(0..100000),
    enter_date: start_date,
    exit_date: end_date
  })
  p "Booking: #{new_booking}"
  new_booking.save
  generate_review(new_booking)
end

def generate_review(booking)
  new_review = Review.new({
    content: Faker::Restaurant.review,
    rating: rand(0..5),
    booking_id: booking.id
  })
  p "Review: #{new_review}"
  new_review.save
end

# Returns an array of 100 profiles
def user_api_call
  api_key = "33d7ed1cc08d6f5586e8dd45dd409b"
  url = "https://uifaces.co/api"
  request= ""
  response = RestClient.post(
    url,
    request,
    :content_type => :json, :accept => :json, :'X-API-KEY' => api_key)
  result_array = JSON.parse(response)
end

# Splitting 100 users into 'guests' and 'owners'
array_of_users = user_api_call
hosts = array_of_users[0...49]
guests = array_of_users[49..99]

# Generating 50 host objects and saving to database.
hosts.each do |user|
  first_name = user["name"].split(" ")[0]
  last_name = user["name"].split(" ")[1]
  email = user["email"]
  bio = bio_generator # See line 15 for method definition
  photos = user["photo"]

  new_user = User.new({
    owner: true,
    first_name: first_name,
    last_name: last_name,
    password: Faker::Address.city,
    email: email,
    bio: bio,
    photos: photos,
  })

  p "Hosts: #{new_user}"
  new_user.save

  generate_appartment(new_user.id)
end

# Generating 50 user objects and saving to database.
guests.each do |user|
  first_name = user["name"].split(" ")[0]
  last_name = user["name"].split(" ")[1]
  email = user["email"]
  bio = bio_generator # See line 15 for method definition
  photos = user["photo"]

  new_user = User.new({
    owner: false,
    first_name: first_name,
    last_name: last_name,
    password: Faker::Address.city,
    email: email,
    bio: bio,
    photos: photos,
    })

  p "Guests: #{new_user}"
  new_user.save
end

# Seeding bookings and reviews
1000.times do
  generate_booking
end














