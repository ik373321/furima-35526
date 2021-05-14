class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :products
 has_many :records
 validates :nickname, :last_name, :first_name, :birthday, presence: true
 PASSWORD_VALIDATES = PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
 validates :password, format: { with: PASSWORD_VALIDATES }
 NAME_KANA_VALIDATES = /\A[ァ-ヶー－]+\z/
 validates :last_name_kana, format: { with: NAME_KANA_VALIDATES, presence: true}
 validates :first_name_kana, format: { with: NAME_KANA_VALIDATES, presence: true}
 validates :password, confirmation: true
 EMAIL_VALIDATES = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 validates :email, format: { with: EMAIL_VALIDATES }, uniqueness: { case_sensitive: false }
end
