class Farmland < ApplicationRecord
    has_many :records
    belongs_to :farmer
    
    validates :land, presence: true
    validates :area, presence: true
    validates :overview, presence: true

end
