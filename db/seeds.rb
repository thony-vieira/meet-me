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

puts "Rodando........."
at1 = Activity.create!(title: "bar do Bolinha", category: "bar", address: "rua não sei")
user1 = User.create!(first_name: "Caio", last_name: "Rocha", address: "Rua 111", email: "master1@master1.com", password: 123123)
group1 = Group.create!(name: "rolê 1", category: "Bar", user: user1, activity: at1)

at2 = Activity.create!(title: "bar do zé", category: "bar", address: "rua talvez alguma")
user2 = User.create!(first_name: "Pedro", last_name: "Nascimento", address: "Rua 222", email: "master2@master2.com", password: 123123)
group2 = Group.create!(name: "rolê 2", category: "Bar", user: user2, activity: at2)

at3 = Activity.create!(title: "vintão", category: "restaurante", address: "av paulista")
user3 = User.create!(first_name: "Debora", last_name: "Lee", address: "Rua 333", email: "master3@master3.com", password: 123123)
group3 = Group.create!(name: "rolê 3", category: "Restaurante", user: user3, activity: at3)

at4 = Activity.create!(title: "MC", category: "Morte", address: "rua rua rua")
user4 = User.create!(first_name: "Anthony", last_name: "Moura", address: "Rua 444", email: "master4@master4.com", password: 123123)
group4 = Group.create!(name: "rolê 4", category: "Morte", user: user4, activity: at4)
puts "Pronto"
