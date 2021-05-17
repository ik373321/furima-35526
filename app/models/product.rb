class Product < ApplicationRecord

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category, :condition, :prefecture, :ship_method, :day_ship
    validates :name, :details, :price ,  presence: true
    validates :category_id, :condition_id, :prefecture_id, :ship_method_id, :day_ship_id, numericality: { other_than: 1 }

  has_one_attached :image
  #has_one :record
  belongs_to :user
end
