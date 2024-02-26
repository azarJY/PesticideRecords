class Pesticide < ApplicationRecord
    has_many :records
    belongs_to :farmer
end