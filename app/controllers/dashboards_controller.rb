class DashboardsController < ApplicationController
    def root 
        @user = current_user 
        @most_5_spread_cities_for_diseases = Disease.most_5_spread_cities_for_diseases
        @count_cases =  Case.count_cases
        @count_patients = Patient.count_patients 
        @count_govermorates = Governorate.count_governorates
        @count_diseases = Disease.count_diseases
        @coun_cities = City.count_cities 
        @most_8_diseases = Disease.most_8_diseases
        @most_cities_have_patients = Patient.most_cities_have_patients
    end 
end
