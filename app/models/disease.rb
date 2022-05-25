class Disease < ApplicationRecord
   has_many :cases
   
   def self.count_diseases 
       Disease.count
   end 

   def self.most_8_diseases
       Disease.joins(:cases)
              .select("diseases.name, count(cases.id) as dcount")
              .group("diseases.id")
              .order("dcount")
              .limit(8)
   end 

   def self.most_5_spread_cities_for_diseases
       Disease.joins(cases: [{patient: [{city: :governorate}]}])
              .select("diseases.name as disease_name, cities.name as city_name, governorates.name as governorate_name, diseases.contagious, count(diseases.id) as count_diseases")
              .group("diseases.id, patients.city_id")
              .order("patients.city_id")
              .limit(5)
   end 

end
