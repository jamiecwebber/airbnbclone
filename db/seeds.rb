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
guests = array_of_users[0...49]
hosts = array_of_users[49..99]

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
    password: first_name + last_name
    })

  new_user.save
end

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
    password: first_name + last_name
  })
  new_user.save

  generate_appartment(new_user.id)
end










