class Record < ApplicationRecord
    belongs_to :famer
    belongs_to :farmland
    belongs_to :pesticide
end
