# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# puts "Cleaning up database..."
# Groups.destroy_all
# Activities.destroy_all
# User.destroy_all

# puts "Rodando........."
# Activity.create!(title: "bar do Bolinha", category: "bar", address: "rua não sei")


# user2 = User.create!(email: "master1@master1.com", password: 123123)
# user2.groups.create!(name: "rolê no bar do bolinha", category: "Bar")
# user2.groups.activities.create(title: "Bar do Bolinha", category: "bar", address: "rua não sei", image: "100")
