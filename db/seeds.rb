# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Creating Users...'

users_array = [
  {
  first_name: 'John',
  last_name: 'Ember',
  email: 'john@nerdchimp.io',
  password: '123123'
  # remote_photo_url: "https://res.cloudinary.com/drdm61dhy/image/upload/c_thumb,g_face,h_200,w_200/v1574940874/nerdchimp/User_1_nkzcin.jpg"
  },
  {
  # testing what happens if same names are appended to database
  first_name: 'John',
  last_name: 'Ember',
  email: 'john2@nerdchimp.io',  # Must be unique email address
  password: '123123'
  # remote_photo_url: "https://res.cloudinary.com/drdm61dhy/image/upload/c_thumb,g_face,h_200,w_200/v1574257753/nerdchimp/Charles_wvep0m.jpg"
  },
  {
  first_name: 'Sam',
  last_name: 'Jones',
  email: 'sam@nerdchimp.io',
  password: '123123'
  # remote_photo_url: "https://res.cloudinary.com/drdm61dhy/image/upload/v1574949255/nerdchimp/Profile_Picture_h562wp.jpg"
  },
  {
  first_name: 'James',
  last_name: 'Bond',
  email: 'alex@nerdchimp.io',
  password: '123123'
  # remote_photo_url: "https://res.cloudinary.com/drdm61dhy/image/upload/c_thumb,g_face,h_200,w_200/v1574257896/nerdchimp/James_Bond_i5l5og.jpg"
  },
  {
  first_name: 'Haley',
  last_name: 'Summers',
  email: 'haley@nerdchimp.io',
  password: '123123'
  # remote_photo_url: "https://res.cloudinary.com/drdm61dhy/image/upload/c_thumb,g_face,h_200,w_200/v1574257896/nerdchimp/Octocat_itmdrk.png"
  },
  {
  first_name: 'Lara',
  last_name: 'Croft',
  email: 'lara@nerdchimp.io',
  password: '123123'
  # remote_photo_url: "https://res.cloudinary.com/drdm61dhy/image/upload/c_thumb,g_face,h_200,w_200/v1574258088/nerdchimp/Lara_Croft_knq7v7.jpg"
  }
]

User.create!(users_array)
puts 'Finished creating users'
puts "create articles"
20.times do
  Article.create(
    title: Faker::Name.unique.name,
    content: "<h5>Surfen ist toll</h5><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam expedita explicabo eligendi odio nobis, odit cumque saepe minima in enim. Atque distinctio molestiae eveniet at assumenda ratione. Similique placeat tempora nesciunt provident perferendis sed molestias aspernatur tenetur consectetur sequi quas, qui officia expedita non corrupti hic dolores.<br> Aut corporis facilis, ipsa est temporibus adipisci, velit, officiis distinctio accusantium suscipit aspernatur!<br> Expedita magni quisquam modi, rem id voluptates fuga perferendis sapiente adipisci quaerat quia.</p><h5>#{Faker::ChuckNorris.unique.fact}</h5><p> Itaque eligendi ab, accusamus rem  asperiores sit similique facere sint deserunt culpa, earum cumque consequuntur illo nisi sequi! Reiciendis ipsa vel iste nam nulla libero soluta nostrum.</p>",
    user_id: 1
    )
end


