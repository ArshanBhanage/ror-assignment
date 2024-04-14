require 'faker'

# Seed patients
# 100.times do
#   Patient.create!(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     dob: Faker::Date.birthday(min_age: 18, max_age: 90),
#     gender: Faker::Gender.binary_type,
#     address: Faker::Address.full_address,
#     phone: Faker::PhoneNumber.phone_number,
#     email: Faker::Internet.email,
#   )
# end

# Seed appointments
# 100.times do
#     Appointment.create!(
#       patient_id: Faker::Number.between(from: 6, to: 100),
#       doctor_id: [1, 7, 8].sample, # Assuming you have 5 doctors
#       appointment_date: Faker::Time.forward(days: 30, period: :morning), # Appointments in the future
#       reason: Faker::Lorem.sentence
#     )
# end

# 100.times do
#     Patient.create!(
#       first_name: Faker::Name.first_name,
#       last_name: Faker::Name.last_name,
#       dob: Faker::Date.birthday(min_age: 1, max_age: 90),
#       gender: Faker::Gender.binary_type,
#       address: Faker::Address.full_address,
#       phone: Faker::PhoneNumber.phone_number,
#       email: Faker::Internet.email,
#       created_at: Faker::Time.backward(days: 365, period: :all),
#       updated_at: Faker::Time.backward(days: 365, period: :all)
#     )
# end

# Define the target range
start_date = Date.new(2024, 4, 6)  # 7 days before April 13, 2024
end_date = Date.new(2024, 4, 12)   # 1 day before April 13, 2024

# Generate seed data for each day in the range
(start_date..end_date).each do |date|
  100.times do  # Generate 10 records per day, adjust the number as needed
    Patient.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      dob: Faker::Date.birthday(min_age: 18, max_age: 65),
      gender: Faker::Gender.binary_type,
      address: Faker::Address.full_address,
      phone: Faker::PhoneNumber.phone_number,
      email: Faker::Internet.email,
      created_at: Faker::Time.between(from: date.beginning_of_day, to: date.end_of_day, format: :default),
      updated_at: Faker::Time.between(from: date.beginning_of_day, to: date.end_of_day, format: :default)
    )
  end
end