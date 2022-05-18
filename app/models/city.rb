class City < ApplicationRecord
    belongs_to :governorate
    has_one :patient
    
    validates :name, presence: true

    def self.count_city
        City.count 
    end
end
