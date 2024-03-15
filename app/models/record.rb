class Record < ApplicationRecord
    belongs_to :farmer
    belongs_to :farmland
    belongs_to :pesticide

    validates :day, presence: true
    validates :name, presence: true
    validates :subject, presence: true
    validates :code, presence: true
    validates :land, presence: true
    validates :amount, presence: true
    validates :water, presence: true
    validates :user, presence: true
    validates :confimer, presence: true

end