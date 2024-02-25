class Pesticide < ApplicationRecord
    has_many :records, dependent: :destroy
    belongs_to :famer
end