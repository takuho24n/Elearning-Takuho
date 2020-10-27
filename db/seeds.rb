# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(name: "Takuho N",
  email: "takuho@email.com",
  password: "password",
  password_confirmation: "password",
  administrator: true)

99.times do |n|
  name = Faker::Food.dish
  email = "user#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password)

end

#Following relationships
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

#Category
Category.create!(title: "Cookies",
  description: "This is a sample category.")

17.times do |n|
  title = Faker::Beer.brand
  description = "Do you like #{n+2} to drink?"
  Category.create!(title: title, description: description)
end