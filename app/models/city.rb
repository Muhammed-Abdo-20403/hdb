class City < ApplicationRecord
    belongs_to :governorate

    
    validates :name, presence: true
end
