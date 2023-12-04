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
at1 = Activity.new(title: "bar do Bolinha", category: "Bars", address: "rua não sei")
file = URI.open("https://source.unsplash.com/random")
# aqui em cima irá o código da API linha 21 e respectivas
at1.photo.attach(io: file, filename: "placeholder.png", content_type: "image/png")
at1.save
user1 = User.create!(first_name: "Caio", last_name: "Rocha", address: "Rua jericó, 193, São Paulo", email: "master1@master1.com", password: 123123)
group1 = Group.create!(name: "rolê 1", category: "Bars", user: user1, activity: at1)

at2 = Activity.new(title: "bar do zé", category: "Bars", address: "rua talvez alguma")
file = URI.open("https://source.unsplash.com/random")
at2.photo.attach(io: file, filename: "placeholder.png", content_type: "image/png")
at2.save
user2 = User.create!(first_name: "Pedro", last_name: "Nascimento", address: "Avenida Paulista 1942, São Paulo", email: "master2@master2.com", password: 123123)
group2 = Group.create!(name: "rolê 2", category: "Bars", user: user2, activity: at2)

at3 = Activity.new(title: "vintão", category: "Restaurants", address: "av paulista")
file = URI.open("https://source.unsplash.com/random")
at3.photo.attach(io: file, filename: "placeholder.png", content_type: "image/png")
at3.save
user3 = User.create!(first_name: "Debora", last_name: "Lee", address: "Rua Feliciano Malabia, 106, São Paulo", email: "master3@master3.com", password: 123123)
group3 = Group.create!(name: "rolê 3", category: "Restaurants", user: user3, activity: at3)

at4 = Activity.new(title: "MC", category: "Bars", address: "rua rua rua")
file = URI.open("https://source.unsplash.com/random")
at4.photo.attach(io: file, filename: "placeholder.png", content_type: "image/png")
at4.save
user4 = User.create!(first_name: "Anthony", last_name: "Moura", address: "Rua Doutor Vicente Giacaglini, 512, São Paulo", email: "master4@master4.com", password: 123123)
group4 = Group.create!(name: "rolê 4", category: "Bars", user: user4, activity: at4)
puts "Pronto"




# file = URI.open("https://source.unsplash.com/random")
