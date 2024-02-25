class Farmland < ApplicationRecord
    has_many :records, dependent: :destroy
    belongs_to :farmer
end