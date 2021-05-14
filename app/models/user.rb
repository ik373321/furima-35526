class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :products
 has_many :records
 
 with_options presence: true do
 validates :nickname
 validates :birthday
 PASSWORD_VALIDATES = PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
 validates :password, format: { with: PASSWORD_VALIDATES }
 NAME_KANA_VALIDATES = /\A[ァ-ヶー－]+\z/
 validates :last_name_kana, format: { with: NAME_KANA_VALIDATES}
 validates :first_name_kana, format: { with: NAME_KANA_VALIDATES}
 validates :password, confirmation: true
 NAME_VALIDATES = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
 validates :first_name, format: { with: NAME_VALIDATES}
 validates :last_name, format: { with: NAME_VALIDATES}
 end

end
