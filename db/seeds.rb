require 'faker'

# # Create Users
# admin = User.create!(
#   email: 'admin@example.com',
#   password: 'password',
#   password_confirmation: 'password',
#   role: 0 # Assuming 0 is for admin
# )

# user = User.create!(
#   email: 'user@example.com',
#   password: 'password',
#   password_confirmation: 'password',
#   role: 1 # Assuming 1 is for regular user
# )

vehicles = []
5.times do
  vehicles << Vehicle.create!(
    vin: Faker::Vehicle.vin,
    make: Faker::Vehicle.make,
    model: Faker::Vehicle.model,
    year: Faker::Vehicle.year
  )
end

vehicles.each do |vehicle|
  Owner.create!(
    name: Faker::Name.name,
    vehicle: vehicle
  )
end

vehicles.each do |vehicle|
  3.times do
    ServiceRecord.create!(
      description: Faker::Vehicle.standard_specs.sample,
      date: Faker::Date.backward(days: 365),
      vehicle: vehicle
    )
  end
end

vehicles.each do |vehicle|
  2.times do
    AccidentReport.create!(
      description: Faker::Lorem.sentence,
      date: Faker::Date.backward(days: 1000),
      vehicle: vehicle
    )
  end
end

puts "Seeding completed!"
