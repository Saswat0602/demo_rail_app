# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Create 5 dummy students
5.times do
  Student.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    contact_number: Faker::PhoneNumber.phone_number,
    address: Faker::Address.full_address,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 30),
    rating: rand(50..100) # Assign a random rating between 50 and 100
  )
end

puts "5 dummy students created."