# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
500.times do
  Offer.create(
    title: [Faker::Vehicle.color, Faker::Vehicle.make_and_model].join(' '),
    content: 'Standard spec: ' + Faker::Vehicle.standard_specs.join(', '),
    price: Faker::Number.decimal(l_digits: 5, r_digits: 2)
  )
end
