class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :ship_method
  belongs_to :day_ship
  validates :name, :details, :price, :image, presence: true
  validates :category_id, :condition_id, :prefecture_id, :ship_method_id, :day_ship_id, numericality: { other_than: 1 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :details, length: { maximum: 40 }
  has_one_attached :image
  # has_one :record
  belongs_to :user
  has_one :record
end
