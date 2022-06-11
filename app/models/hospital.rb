class Hospital < ApplicationRecord
   has_many :cases
   has_many :doctors 
   scope :public_hospitals, -> { where hospital_type: "Public" }
   scope :private_hospitals, -> { where hospital_type: "Private" }
   
   def self.count_hospitals
      Hospital.count
   end 

   def self.count_cases_for_per_hospital 
      Hospital.joins(:cases)
              .select("hospitals.name as hospital_name, count(cases.id) as count_cases")
              .group("hospital_name")
              .order("count_cases desc")
   end

   def self.most_disease_spread_in_hospital
      Hospital.joins(cases: :disease)
              .select("diseases.name as disease_name, hospitals.name as hospital_name, count(cases.id) as ct_cases")
              .group("hospital_name, disease_name")  
              .order("ct_cases desc").limit(6)

   end

end
