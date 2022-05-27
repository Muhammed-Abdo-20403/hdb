class Case < ApplicationRecord
   belongs_to :patient 
   belongs_to :disease
   has_many :hospitals

   def self.count_cases
       Case.count
   end
   def self.most_10_spread_diseases
       Case.joins(:disease, :patient).select("diseases.name, count(patients.city_id) as ccity")
           .group("diseases.id, patients.city_id")
           .order("ccity")
           .limit(10)
   end 

   def self.most_5_spread_cities_for_diseases
       Case.joins(:patient, :cities, :diseases)
           .select("cities.name, diseases.name, count(cases.id) as cases_count")
           .group("diseases.id, patients.city_id")
           .order("cases_count")
           .limit(5)
   end 
end
