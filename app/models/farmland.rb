class Farmland < ApplicationRecord
    has_many :records
    belongs_to :farmer
end
