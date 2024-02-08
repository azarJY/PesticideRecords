class Farmer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :seasons, dependent: :destroy
         has_many :farmlands, dependent: :destroy
         has_many :pesticedes, dependent: :destroy
         has_many :records, dependent: :destroy
end
