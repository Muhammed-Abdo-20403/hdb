# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require_relative 'seed_diseases'
require_relative 'seed_cities'
require_relative 'seed_hospitals'

Rails.logger = Logger.new(STDOUT)
ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.logger.level = Logger::DEBUG

cities_and_governorates

create_hospital

patients = []
10000.times do |patient|
   fake_patients = Patient.new
   fake_patients.name = Faker::Name.name
   fake_patients.email = Faker::Internet.email
   fake_patients.age = Faker::Number.between(from: 1, to: 130)
   fake_patients.gender = Faker::Gender.binary_type
   fake_patients.phone = Faker::PhoneNumber.cell_phone_in_e164
   fake_patients.city_id = rand(1..183)
   patients << fake_patients

   Patient.import patients if patient % 1000 == 0 
end

create_diseases

cases = []
50000.times do |i|
   fake_casees = Case.new
   fake_casees.patient_id = rand(1..10000)
   fake_casees.disease_id = rand(1..169)
   fake_casees.hospital_id = rand(1..368)
   fake_casees.severity = rand(0..1)

   cases << fake_casees

   Case.import cases if i % 10000 == 0 
end
