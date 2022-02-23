# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
require "open-uri"

Van.destroy_all

10.times do
  van = Van.new(
    size: ["S", "M", "L"].sample,
    model: Faker::Vehicle.model,
    brand: Faker::Vehicle.make,
    year: Faker::Vehicle.year,
    price: rand(50..100),
    description: Faker::Vehicle.standard_specs
  )
  van.user = User.first
  van.save
end

Van.all.each do |van|
  file = URI.open('https://images.unsplash.com/photo-1527786356703-4b100091cd2c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80')
  van.photo.attach(io: file, filename: 'banana.png', content_type: 'image/png')
end

# 10.times do |i|
#   Post.create(title: "My post number #{i}")
# end
