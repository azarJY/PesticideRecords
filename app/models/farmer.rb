class Farmer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :seasons, dependent: :destroy
         has_many :farmlands, dependent: :destroy
         has_many :pesticides, dependent: :destroy
         has_many :records, dependent: :destroy

         def guest?
           email == 'noukou@gmail.com'
         end
end