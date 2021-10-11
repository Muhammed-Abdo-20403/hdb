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
1000.times do |patient|
   p = Patient.new
   p.name = Faker::Name.name
   p.email = Faker::Internet.email
   p.age = Faker::Number.between(from: 1, to: 130)
   p.sex = Faker::Gender.binary_type
   p.phone = Faker::PhoneNumber.cell_phone_in_e164
   p.city_id = rand(1..183)
   patients << p

   Patient.import patients if patient % 100 == 0 
end

create_diseases

cases = []
10000.times do |i|
   c = Case.new
   c.patient_id = rand(1..1000)
   c.disease_id = rand(1..169)
   c.severity = rand(0..1)

   cases << c

   Case.import cases if i % 1000 == 0 
end
