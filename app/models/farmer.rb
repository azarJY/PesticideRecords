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
         validates :farm_name, presence: true
         validates :last_name, presence: true
         validates :first_name, presence: true
         validates :last_name_kana, presence: true
         validates :first_name_kana, presence: true
         validates :crop, presence: true
         validates :email, presence: true
end