class Pesticide < ApplicationRecord
    has_many :records
    belongs_to :farmer
    
    validates :name, presence: true
    validates :code, presence: true
    validates :subject, presence: true
    validates :use_method, presence: true
    validates :magnification, presence: true
    validates :usable_number, presence: true
    
end