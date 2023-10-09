# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

medical_speciality = %w[Psychiatry Pediatrics Surgery]
start_time = %w[8am 9am 7am 10am 11am]
end_time = %w[2pm 3pm 4pm 6pm 7pm 8pm 9pm]

20.times do |i|
 doc = Doctor.create!(
        first_name: FFaker::NameNL.first_name,
        last_name: FFaker::NameNL.last_name,
        specialization: medical_speciality.sample,
        email: FFaker::Internet.email
       )

 7.times { |i| Avability.create(doctor_id: doc.id, start_time: start_time.sample, end_time: end_time.sample, weekday: i) }

 puts doc.full_name
end

20.times do |i|
  Patient.create!(
    first_name: FFaker::NameNL.first_name,
    last_name: FFaker::NameNL.last_name,
    email: FFaker::Internet.email
  )
end