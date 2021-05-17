class Product < ApplicationRecord

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category, :condition, :prefecture, :ship_method, :day_ship
    validates :name, :details, :price ,  presence: true
    validates :category_id, :condition_id, :prefecture_id, :ship_method_id, :day_ship_id, numericality: { other_than: 1 }
    validates :price, numericality: { only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: /\A[0-9]+\z/ }
    validates :details, length: { maximum: 40}
  has_one_attached :image
  #has_one :record
  belongs_to :user
end
