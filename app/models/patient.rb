class Patient < ApplicationRecord 
   has_many :cases
   has_many :diseases
   belongs_to :city
   # scope :male, -> { where gender: "Male" }
   # scope :female, -> { where gender: "Female" }
   
   def self.count_patients 
       Patient.count    
   end

   def self.sort_genders 
      count_males = Patient.where(gender: "Male").count
      count_female = Patient.where(gender: "Female").count
   end

   def self.count_patients_with_their_cities
      Patient.joins(:city)
             .select("cities.name as name_cities, count(patients.id) as count_patients")
             .group("name_cities")
             .order("count_patients desc")
   end

   def self.more_sick_patients
       Patient.joins(:cases)
              .select("patients.name, count(*) as more_sick_patients")
              .group("patients.id")
              .order("more_sick_patients desc")
   end 

   def self.most_cities_have_patients
      Patient.joins(city: :governorate)
             .select("cities.name as name_cities, governorates.name as name_governorate, count(patients.id) as count_patients")
             .group("name_cities, name_governorate")
             .order("count_patients desc")
             .limit(7)
   end 
end
