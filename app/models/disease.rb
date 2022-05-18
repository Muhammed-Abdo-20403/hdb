class Disease < ApplicationRecord
   has_many :cases
   belongs_to :patient
   
   def self.count_diseases 
       Disease.count
   end 

   def self.most_10_diseases
       Disease.joins(:cases)
              .select("diseases.name, count(cases.id) as dcount")
              .group("diseases.id")
              .order("dcount")
              .limit(10)
   end 

   def self.most_5_spread_cities_for_diseases
       Disease.joins(cases: :patient)
              .select("diseases.name, patients.city_id, count(diseases.id)")
              .group("diseases.id, patients.city_id")
              .order("patients.city_id")
              .limit(5)
   end 

end
