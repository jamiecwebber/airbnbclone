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

# Returns an array of 100 profiles
def user_api_call
  api_key = "33d7ed1cc08d6f5586e8dd45dd409b"
  url = "https://uifaces.co/api"
  request= ""
  response = RestClient.post(
    url,
    request,
    :content_type => :json, :accept => :json, :'X-API-KEY' => user_api_key)
  result_array = JSON.parse(response)
end

# Splitting 100 users into 'guests' and 'owners'
array_of_users = user_api_call
guests = array_of_users[0..50]
hosts = array_of_users[51..100]

# Generating 50 user objects and saving to database.
guests.each do |user|
  owner = false
  first_name = user["name"].split(" ")[0]
  last_name = user["name"].split(" ")[1]
  email = user["email"]
  bio = bio_generator # See line 15 for method definition
  photos = user["photo"]

  new_user = @User.new(
    first_name: first_name,
    last_name: last_name,
    email: email,
    bio: bio,
    photos: photos
    )
  new_user.save
end

# Generating 50 host objects and saving to database.
hosts.each do |user|
  owner = true
  first_name = user["name"].split(" ")[0]
  last_name = user["name"].split(" ")[1]
  email = user["email"]
  bio = bio_generator # See line 15 for method definition
  photos = user["photo"]

  new_user = @User.new(
    first_name: first_name,
    last_name: last_name,
    email: email,
    bio: bio,
    photos: photos
    )
  new_user.save
end

