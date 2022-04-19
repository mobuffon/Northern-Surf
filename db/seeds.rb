# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# puts 'Creating Users...'
#
# users_array = [
#   {
#   first_name: 'John',
#   last_name: 'Ember',
#   email: 'john@nerdchimp.io',
#   password: '123123',
#   photo: "https://res.cloudinary.com/drdm61dhy/image/upload/c_thumb,g_face,h_200,w_200/v1574940874/nerdchimp/User_1_nkzcin.jpg"
#   },
#   {
#   # testing what happens if same names are appended to database
#   first_name: 'John',
#   last_name: 'Ember',
#   email: 'john2@nerdchimp.io',  # Must be unique email address
#   password: '123123',
#   photo: "https://res.cloudinary.com/drdm61dhy/image/upload/c_thumb,g_face,h_200,w_200/v1574257753/nerdchimp/Charles_wvep0m.jpg"
#   },
#   {
#   first_name: 'Sam',
#   last_name: 'Jones',
#   email: 'sam@nerdchimp.io',
#   password: '123123',
#   photo: "https://res.cloudinary.com/drdm61dhy/image/upload/v1574949255/nerdchimp/Profile_Picture_h562wp.jpg"
#   },
#   {
#   first_name: 'James',
#   last_name: 'Bond',
#   email: 'alex@nerdchimp.io',
#   password: '123123',
#   photo: "https://res.cloudinary.com/drdm61dhy/image/upload/c_thumb,g_face,h_200,w_200/v1574257896/nerdchimp/James_Bond_i5l5og.jpg"
#   },
#   {
#   first_name: 'Haley',
#   last_name: 'Summers',
#   email: 'haley@nerdchimp.io',
#   password: '123123',
#   photo: "https://res.cloudinary.com/drdm61dhy/image/upload/c_thumb,g_face,h_200,w_200/v1574257896/nerdchimp/Octocat_itmdrk.png"
#   },
#   {
#   first_name: 'Lara',
#   last_name: 'Croft',
#   email: 'lara@nerdchimp.io',
#   password: '123123',
#   photo: "https://res.cloudinary.com/drdm61dhy/image/upload/c_thumb,g_face,h_200,w_200/v1574258088/nerdchimp/Lara_Croft_knq7v7.jpg"
#   }
# ]
#
# User.create!(users_array)
# puts 'Finished creating users'
# puts "create articles"
#
# Keyword.create([{
#   word: 'Windsurfing'
# }, {word: 'Kitesurfing'}, {word: 'Surfing'}, {word: 'Windy'}, {word: 'Cold'}] )
#
# 20.times do
#   Article.create(
#     title: Faker::Name.unique.name,
#     content: "<h5>Surfen ist toll</h5><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam expedita explicabo eligendi odio nobis, odit cumque saepe minima in enim. Atque distinctio molestiae eveniet at assumenda ratione. Similique placeat tempora nesciunt provident perferendis sed molestias aspernatur tenetur consectetur sequi quas, qui officia expedita non corrupti hic dolores.<br> Aut corporis facilis, ipsa est temporibus adipisci, velit, officiis distinctio accusantium suscipit aspernatur!<br> Expedita magni quisquam modi, rem id voluptates fuga perferendis sapiente adipisci quaerat quia.</p><h5>#{Faker::ChuckNorris.unique.fact}</h5><p> Itaque eligendi ab, accusamus rem  asperiores sit similique facere sint deserunt culpa, earum cumque consequuntur illo nisi sequi! Reiciendis ipsa vel iste nam nulla libero soluta nostrum.</p>",
#     user_id: [1,2,3,4,5].sample,
#     description: Faker::ChuckNorris.unique.fact,
#     location: Faker::Address.state
#     )
# end
# p 'thiss'
# counter = 0
# 20.times do
#   counter += 1
#   Jointkey.create(
#     article_id: counter,
#     keyword_id: [1,2,3,4,5].sample
#     )
# end
# counter = 0
# 20.times do
#   counter += 1
#   Jointkey.create(
#     article_id: counter,
#     keyword_id: [1,2,3,4,5].sample
#     )
# end



spots_array = [
  {location: "Boote Sohlbach Wiesbaden",
  latitude: 50.026302,
  longitude: 8.259558,
  url: "https://de.windfinder.com/forecast/boote-sohlbach-e-k"},
  {location: "Heidkate",
  latitude: 54.433553181955624,
  longitude: 10.323502492648755,
  url: "https://de.windfinder.com/forecast/heidkate"},

{location: "Mainz",
  latitude: 49.99167,
  longitude: 8.25361,
  url: "https://de.windfinder.com/forecast/mainz"
},
  {location: "Fehmarn Gold",
  latitude: 54.425231795612724,
  longitude: 11.098228381698831,
  url: "https://de.windfinder.com/forecast/gold"
},
  {location: "Timmendorfer Strand",
  latitude: 53.997027,
  longitude: 10.777585,
  url: "https://de.windfinder.com/forecast/timmendorfer_strand_ostsee"
},
  {location: "Pelzerhaken",
  latitude: 54.085539,
  longitude: 10.866908,
  url: "https://de.windfinder.com/forecast/pelzerhaken"
},
{ location: "Dahme",
  latitude: 54.22239354175302,
  longitude: 11.080541438816923,
  url: "https://de.windfinder.com/forecast/dahme"
},
{ location: "Westerland",
  latitude: 54.908729,
  longitude: 8.311284,
  url: "https://de.windfinder.com/forecast/brandenburger_strand_westerland"
},
{ location: "Brasilien/Ostsee",
  latitude: 54.42537469767045,
  longitude:  10.382401565403526,
  url: "https://de.windfinder.com/forecast/brasilien_mittelstrand"
},
{ location: "Grömiz",
  latitude: 54.14882995780895,
  longitude:  10.968069373994668,
  url: "https://de.windfinder.com/forecast/groemitz"
},
{ location: "Kühlungsborn",
  latitude: 54.15187289285922,
  longitude:  11.739528141098496,
  url: "https://de.windfinder.com/forecast/ostseebad_kuehlungsborn_mecklenburg_vorpommern_germany"
},
{ location: "Hvide Sande",
  latitude: 56.00793706113139,
  longitude:  8.110889426975278,
  url: "https://de.windfinder.com/forecast/hvide_sande"
},
{ location: "St. Peter Ording",
  latitude: 54.287536897234126,
  longitude: 8.632352678543802,
  url: "https://de.windfinder.com/forecast/st._peter-ording"
},
{ location: "Laboe",
  latitude: 54.405214114644295,
  longitude: 10.221583623507062,
  url: "https://de.windfinder.com/forecast/laboe"
},
{ location: "Warnemünde",
  latitude: 54.17443085275505,
  longitude: 12.07091668178354,
  url: "https://de.windfinder.com/forecast/warnemuende"
},
{ location: "Klitøller",
  latitude: 57.036856865104795,
  longitude: 8.478218350287,
  url: "https://de.windfinder.com/forecast/klitmoller"
},
{ location: "Staberhuk",
  latitude: 57.036856865104795,
  longitude: 8.478218350287,
  url: "https://de.windfinder.com/forecast/staberhuk"
}
]
Spot.create!(spots_array)
puts 'Finished creating spots'
