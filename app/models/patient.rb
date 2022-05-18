class Patient < ApplicationRecord 
   has_many :cases
   has_many :diseases
   belongs_to :city
   
   def self.sort_genders 
      @count_males = Patient.where(sex: "Male").count
      count_female = Patient.where(sex: "Female").count
   end

   def self.count_patients_with_their_cities
      Patient.joins(:city)
             .select("cities.name as name_cities, count(patients.id) as count_patients")
             .group("name_cities")
             .order("count_patients desc")
   end

   def self.more_sick_patients
       Patient.joins(:cases)
              .select("patients.name, count(*) as sick_patients")
              .group("patients.id")
              .order("sick_patients desc")
   end 

   def self.count_patients_with_them_cities
      Patient.joins(:city)
             .select("cities.name as name_cities, count(patients.id) as count_patients")
             .group("cities.name")
             .order("count_patients desc")
   end
end
