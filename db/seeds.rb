# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

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

# 10.times do |i|
#   Post.create(title: "My post number #{i}")
# end
