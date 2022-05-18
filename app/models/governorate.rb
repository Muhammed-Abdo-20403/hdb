class Governorate < ApplicationRecord
    has_many :cities

    
    def self.count_governorates
        Governorate.count
    end 

    def self.govermorates_and_its_cities
        Governorate.joins(cities)
                   .select("governorates.name, count(cities.id) as cities_count")
                   .group("governorates.name")
                   .order("cities_count desc")
    end 

end
