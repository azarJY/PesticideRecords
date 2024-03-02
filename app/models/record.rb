class Record < ApplicationRecord
    belongs_to :farmer
    belongs_to :farmland
    belongs_to :pesticide
end