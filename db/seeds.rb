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

# at1 = Activity.new(title: "bar do Bolinha", category: "Bar", address: "Rua jericó, 193, São Paulo")
# file = URI.open("https://source.unsplash.com/random")
# # aqui em cima irá o código da API linha 21 e respectivas
# at1.photo.attach(io: file, filename: "placeholder.png", content_type: "image/png")
# at1.save
# user1 = User.create!(first_name: "Caio", last_name: "Rocha", address: "Rua brigadeiro tobias, 669, São Paulo", email: "master1@master1.com", password: 123123)
# group1 = Group.create!(name: "rolê 1", category: "Bar", user: user1, activity: at1)

# # at2 = Activity.new(title: "bar do zé", category: "Bar", address: "Rua Maria Borba, 40 - Higienópolis, São Paulo")
# # file = URI.open("https://source.unsplash.com/random")
# # at2.photo.attach(io: file, filename: "placeholder.png", content_type: "image/png")
# # at2.save
# user2 = User.create!(first_name: "Pedro", last_name: "Nascimento", address: "Avenida Paulista 1942, São Paulo", email: "master2@master2.com", password: 123123)
# # group2 = Group.create!(name: "rolê 2", category: "Bar", user: user2, activity: at2)

# at3 = Activity.new(title: "vintão", category: "Restaurant", address: "Avenida São João, 677, São Paulo")
# file = URI.open("https://source.unsplash.com/random")
# at3.photo.attach(io: file, filename: "placeholder.png", content_type: "image/png")
# at3.save
# user3 = User.create!(first_name: "Debora", last_name: "Lee", address: "Rua do Paraíso, 515, São Paulo", email: "master3@master3.com", password: 123123)
# group3 = Group.create!(name: "rolê 3", category: "Restaurant", user: user3, activity: at3)

# # at4 = Activity.new(title: "MC", category: "Bar", address: "Rua Cunha Horta, 70 - Consolação, São Paulo")
# # file = URI.open("https://source.unsplash.com/random")
# # at4.photo.attach(io: file, filename: "placeholder.png", content_type: "image/png")
# # at4.save
# user4 = User.create!(first_name: "Anthony", last_name: "Moura", address: "Rua da Mooca, 200, Mooca, São Paulo", email: "master4@master4.com", password: 123123)
# # group4 = Group.create!(name: "rolê 4", category: "Bar", user: user4, activity: at4)

@client = GooglePlaces::Client.new(ENV["GOOGLE_API_KEY"])

# center mark activities 4 users
lat = -23.556496075
lng = -46.631711700000004

bars = @client.spots(lat, lng, types: 'bar')
restaurants = @client.spots(lat, lng, types: 'restaurant')

bars.first(5).each do |bar|
  array = Activity.create!(
    title: bar.name,
    category: "Bar",
    address: bar.vicinity,
    latitude: bar.lat,
    longitude: bar.lng,
    rating: bar.rating
  )
end

bar1 = Activity.offset(0).first
bar1.image = "https://hettwer.com.br/wp-content/uploads/2023/09/happy-hour-ipiranga-hettwer.jpg"
bar1.save

bar2 = Activity.offset(1).first
bar2.image = "https://www.melhoresdestinos.com.br/wp-content/uploads/2022/10/melhores-bares-do-mundo-pesquisa-capa-1536x805.jpg"
bar2.save

bar3 = Activity.offset(2).first
bar3.image = "https://servircomrequinte.francobachot.com.br/wp-content/uploads/2018/07/bar_restaurante_rosa_mexicano-631x542.jpg"
bar3.save

bar4 = Activity.offset(3).first
bar4.image = "https://images.squarespace-cdn.com/content/v1/59e8e2ea8c56a80a6c652dc2/1643290907817-7U7C08RD0NBQOHPOE8DQ/Cena_site.jpg?format=1500w"
bar4.save

bar5 = Activity.offset(4).first
bar5.image = "https://thatsup.website/storage/265/18680/responsive-images/FUJI4919___media_library_original_562_375.jpg"
bar5.save

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

restaurant1 = Activity.offset(5).first
restaurant1.image = "https://cdn.vox-cdn.com/thumbor/hmnYbOsIPrTtYwApbETNBdPnZno=/0x0:5461x3641/2220x1665/filters:focal(2295x1385:3167x2257):format(webp):no_upscale()/cdn.vox-cdn.com/uploads/chorus_image/image/71974835/Nelita_2__cred_Clayton_Vieira.0.jpeg"
restaurant1.save

restaurant2 = Activity.offset(6).first
restaurant2.image = "https://cdn.vox-cdn.com/thumbor/loB8RE7eYpA2KDL4JNU7RCS7B10=/0x0:1024x681/2220x1665/filters:focal(431x259:593x421):format(webp):no_upscale()/cdn.vox-cdn.com/uploads/chorus_image/image/62531762/mani-sao-paulo.0.0.0.jpg"
restaurant2.save

restaurant3 = Activity.offset(7).first
restaurant3.image = "https://cdn.vox-cdn.com/thumbor/w0CwfMFz0Uf-IWF2khzxBfxxRvI=/0x0:960x625/2220x1665/filters:focal(404x236:556x388):format(webp):no_upscale()/cdn.vox-cdn.com/uploads/chorus_image/image/62531735/Fasano2_Facebook.0.0.0.jpg"
restaurant3.save

restaurant4 = Activity.offset(8).first
restaurant4.image = "https://cdn.vox-cdn.com/thumbor/-51one_Hsp7jBT47LthaQWNWyNM=/0x0:1920x1275/2220x1665/filters:focal(807x485:1113x791):format(webp):no_upscale()/cdn.vox-cdn.com/uploads/chorus_image/image/62531757/Rodeio.732.jpeg"
restaurant4.save

restaurant5 = Activity.offset(9).first
restaurant5.image = "https://lh3.googleusercontent.com/p/AF1QipMd4hBIixuG4XVfBhlonm06bZF3iySY81iRTQB6=s1360-w1360-h1020"
restaurant5.save


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


bar11 = Activity.offset(10).first
bar11.image = "https://conteudo.imguol.com.br/c/entretenimento/d3/2022/10/18/agito-do-bar-paradiso-de-barcelona-1666096825973_v2_900x506.jpg.webp"
bar11.save

bar22 = Activity.offset(11).first
bar22.image = "https://cedenorte.edu.co/wp-content/uploads/2020/12/estudiar-gestion-de-bares-medellin.jpg"
bar22.save

bar33 = Activity.offset(12).first
bar33.image = "https://queroserbartender.com.br/wp-content/uploads/2022/11/Foto-site.png"
bar33.save

bar44 = Activity.offset(13).first
bar44.image = "https://uploads.metropoles.com/wp-content/uploads/2021/09/29120152/61abcd96534e4ac8d1a9f30e75e2a6be.jpg"
bar44.save

bar55 = Activity.offset(14).first
bar55.image = "https://static.wixstatic.com/media/2ea7d3_d051ac837ea54d909c95fdd9f9298600~mv2.jpg/v1/fill/w_456,h_328,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/salve_jorge_3-avnc.jpg"
bar55.save


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



restaurant11 = Activity.offset(15).first
restaurant11.image = "https://www.cnnbrasil.com.br/viagemegastronomia/wp-content/uploads/sites/5/2022/08/votre-brasserie.jpeg?w=1200&h=675&crop=1"
restaurant11.save

restaurant22 = Activity.offset(16).first
restaurant22.image = "https://cdn.vox-cdn.com/thumbor/6-OXGJaXnQp-miIlg5rWdjqzq3s=/0x0:960x720/2220x1665/filters:focal(404x284:556x436):format(webp):no_upscale()/cdn.vox-cdn.com/uploads/chorus_image/image/62531738/Tordesilhas_Facebook.0.0.0.jpg"
restaurant22.save

restaurant33 = Activity.offset(17).first
restaurant33.image = "https://cdn.vox-cdn.com/thumbor/eW_gbXqN7RZJiYUIpV_y9BmOZTg=/0x0:1024x682/2220x1665/filters:focal(431x260:593x422):format(webp):no_upscale()/cdn.vox-cdn.com/uploads/chorus_image/image/62531732/DOM-getty-saopaulo.0.0.0.jpg"
restaurant33.save

restaurant44 = Activity.offset(18).first
restaurant44.image = "https://cdn.vox-cdn.com/thumbor/6amTK8B9QZpnh22N9yBYzWJ9950=/0x0:3456x1935/2220x1665/filters:focal(1452x692:2004x1244):format(webp):no_upscale()/cdn.vox-cdn.com/uploads/chorus_image/image/65661812/IMG_8931.0.jpg"
restaurant44.save

restaurant55 = Activity.offset(19).first
restaurant55.image = "https://cdn.vox-cdn.com/thumbor/Dhhho1cb5vxIORjJUETyaCowE94=/0x0:1024x762/2220x1665/filters:focal(485x224:647x386):format(webp):no_upscale()/cdn.vox-cdn.com/uploads/chorus_image/image/62531736/Bar_Da_Dona_Onc_a.734.jpeg"
restaurant55.save



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

cafe1 = Activity.offset(20).first
cafe1.image = "https://casacor.abril.com.br/wp-content/uploads/sites/7/2023/04/Cafe%CC%81-Habitual.jpg?quality=90&strip=info&w=1199&h=560&crop=1"
cafe1.save

cafe2 = Activity.offset(21).first
cafe2.image = "https://casacor.abril.com.br/wp-content/uploads/sites/7/2023/04/Futuro-Refeitorio.jpg?quality=90&strip=info&w=1024&crop=1"
cafe2.save

# cafe3 = Activity.offset(22).first
# cafe3.image = ""
# cafe3.save

# cafe4 = Activity.offset(23).first
# cafe4.image = ""
# cafe4.save

# cafe5 = Activity.offset(24).first
# cafe5.image = ""
# cafe5.save


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



park1 = Activity.offset(22).first
park1.image = "https://www.silverkris.com/wp-content/uploads/2016/10/munich-hofgarten.jpg"
park1.save

park2 = Activity.offset(23).first
park2.image = "https://cdn.contexttravel.com/image/upload/w_1500,q_60/v1674244832/blog/London%20Context%20Silo%2C%20Jan%202023/Kew_Gardens.jpg"
park2.save

# park3 = Activity.offset(27).first
# park3.image = ""
# park3.save

# park4 = Activity.offset(28).first
# park4.image = ""
# park4.save

# park5 = Activity.offset(29).first
# park5.image = ""
# park5.save


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


cafe11 = Activity.offset(24).first
cafe11.image = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpY9IpToWiQs0-w-TaG8Xle7GUcS_gc9rl9UODF-aKp0dqT2v1nXPXf_qnGhCV9lxsr_Q&usqp=CAU"
cafe11.save

cafe22 = Activity.offset(25).first
cafe22.image = "https://media.architecturaldigest.com/photos/56e9c2af6836c03a28818cca/16:9/w_2580,c_limit/Devocion.jpg"
cafe22.save

# cafe33 = Activity.offset(32).first
# cafe33.image = ""
# cafe33.save

# cafe44 = Activity.offset(33).first
# cafe44.image = ""
# cafe44.save

# cafe55 = Activity.offset(34).first
# cafe55.image = ""
# cafe55.save


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


park11 = Activity.offset(26).first
park11.image = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStmTwao6F3Hp3ZDoKs98n1AN6omdMcOgB6xw&usqp=CAU"
park11.save

park22 = Activity.offset(27).first
park22.image = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyWF_cZIw0xKq0uPF_PTiKltycEJYiGrmOnw&usqp=CAU"
park22.save

# park33 = Activity.offset(37).first
# park33.image = ""
# park33.save

# park44 = Activity.offset(38).first
# park44.image = ""
# park44.save

# park55 = Activity.offset(39).first
# park55.image = ""
# park55.save

puts "Pronto"
# file = URI.open("https://source.unsplash.com/random")
