# This file should contain all the record creation needed to seeds the database with its default values.
# The data can then be loaded with the rails db:seeds command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Dir[Rails.root.join('db/seeds/*.rb')].sort.each do |file|
  puts "Processing #{file.split('/').last}"
  require file
end

# 5.times do |i|
#   Product.create(name: "Product ##{i}", description: "A product.")
# end

## Roles example
# Role.find_or_create_by(name: ‘Patient’) do |patient|
#   Patient.availability = ‘8-5’
# end
# Role.find_or_create_by(name: ‘Doctor’)
#
#
## Users
# patient_role = Role.find_by_name(‘Patient’)
# doctor_role = Role.find_by_name(‘Doctor’)
#
# User.find_or_create_by(first_name: ‘John’, last_name: ‘Doe’, role: patient_role)
# User.find_or_create_by(first_name: ‘Janne’, last_name: ‘Doe’, role: doctor_role)


