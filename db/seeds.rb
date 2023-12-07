require "open-uri"

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning up database..."
Member.destroy_all
User.destroy_all
Activity.destroy_all
Group.destroy_all

puts "Rodando........."

at1 = Activity.new(title: "bar do Bolinha", category: "Bar", address: "Rua jericó, 193, São Paulo")
file = URI.open("https://source.unsplash.com/random")
# aqui em cima irá o código da API linha 21 e respectivas
at1.photo.attach(io: file, filename: "placeholder.png", content_type: "image/png")
at1.save
user1 = User.create!(first_name: "Caio", last_name: "Rocha", address: "Rua brigadeiro tobias, 669, São Paulo", email: "master1@master1.com", password: 123123)
group1 = Group.create!(name: "rolê 1", category: "Bar", user: user1, activity: at1)

# at2 = Activity.new(title: "bar do zé", category: "Bar", address: "Rua Maria Borba, 40 - Higienópolis, São Paulo")
# file = URI.open("https://source.unsplash.com/random")
# at2.photo.attach(io: file, filename: "placeholder.png", content_type: "image/png")
# at2.save
user2 = User.create!(first_name: "Pedro", last_name: "Nascimento", address: "Avenida Paulista 1942, São Paulo", email: "master2@master2.com", password: 123123)
# group2 = Group.create!(name: "rolê 2", category: "Bar", user: user2, activity: at2)

at3 = Activity.new(title: "vintão", category: "Restaurant", address: "Avenida São João, 677, São Paulo")
file = URI.open("https://source.unsplash.com/random")
at3.photo.attach(io: file, filename: "placeholder.png", content_type: "image/png")
at3.save
user3 = User.create!(first_name: "Debora", last_name: "Lee", address: "Rua do Paraíso, 515, São Paulo", email: "master3@master3.com", password: 123123)
group3 = Group.create!(name: "rolê 3", category: "Restaurant", user: user3, activity: at3)

# at4 = Activity.new(title: "MC", category: "Bar", address: "Rua Cunha Horta, 70 - Consolação, São Paulo")
# file = URI.open("https://source.unsplash.com/random")
# at4.photo.attach(io: file, filename: "placeholder.png", content_type: "image/png")
# at4.save
user4 = User.create!(first_name: "Anthony", last_name: "Moura", address: "Rua da Mooca, 200, Mooca, São Paulo", email: "master4@master4.com", password: 123123)
# group4 = Group.create!(name: "rolê 4", category: "Bar", user: user4, activity: at4)

@client = GooglePlaces::Client.new(ENV["GOOGLE_API_KEY"])

# center mark activities 4 users
lat = -23.556496075
lng = -46.631711700000004

bars = @client.spots(lat, lng, types: 'bar')
restaurants = @client.spots(lat, lng, types: 'restaurant')

bars.first(5).each do |bar|
  Activity.create!(
    title: bar.name,
    category: "Bar",
    address: bar.vicinity,
    latitude: bar.lat,
    longitude: bar.lng,
    rating: bar.rating
  )
end

restaurants.first(5).each do |restaurant|
  Activity.create!(
    title: restaurant.name,
    category: "Restaurant",
    address: restaurant.vicinity,
    latitude: restaurant.lat,
    longitude: restaurant.lng,
    rating: restaurant.rating
  )
end

# center mark activities 3 users(caio, debora, pedro)
lat1 = -23.556327699999997
lng1 = -46.644399400000005

bars = @client.spots(lat1, lng1, types: 'bar')
restaurants = @client.spots(lat1, lng1, types: 'restaurant')

bars.first(5).each do |bar|
  Activity.create!(
    title: bar.name,
    category: "Bar",
    address: bar.vicinity,
    latitude: bar.lat,
    longitude: bar.lng,
    rating: bar.rating
  )
end

restaurants.first(5).each do |restaurant|
  Activity.create!(
    title: restaurant.name,
    category: "Restaurant",
    address: restaurant.vicinity,
    latitude: restaurant.lat,
    longitude: restaurant.lng,
    rating: restaurant.rating
  )
end

cafes = @client.spots(lat, lng, types: 'cafe')
parks = @client.spots(lat, lng, types: 'park')

cafes.first(2).each do |cafe|
  Activity.create!(
    title: cafe.name,
    category: "Café",
    address: cafe.vicinity,
    latitude: cafe.lat,
    longitude: cafe.lng,
    rating: cafe.rating
  )
end

parks.first(2).each do |park|
  Activity.create!(
    title: park.name,
    category: "Park",
    address: park.vicinity,
    latitude: park.lat,
    longitude: park.lng,
    rating: park.rating
  )
end

cafes = @client.spots(lat1, lng1, types: 'cafe')
parks = @client.spots(lat1, lng1, types: 'park')

cafes.first(2).each do |cafe|
  Activity.create!(
    title: cafe.name,
    category: "Café",
    address: cafe.vicinity,
    latitude: cafe.lat,
    longitude: cafe.lng,
    rating: cafe.rating
  )
end

parks.first(2).each do |park|
  Activity.create!(
    title: park.name,
    category: "Park",
    address: park.vicinity,
    latitude: park.lat,
    longitude: park.lng,
    rating: park.rating
  )
end

puts "Pronto"
# file = URI.open("https://source.unsplash.com/random")
