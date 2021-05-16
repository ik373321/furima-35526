class Product < ApplicationRecord
  has_one_attached :image
  #has_one :record
  belongs_to :user
end
