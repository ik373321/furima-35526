class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :builing, :mobile, :user_id, :product_id, :token

  # ここにバリデーションの処理を書く
  validates :postal_code, :prefecture_id, :city, :block, :mobile, :user_id, :product_id, :token, presence: true
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :mobile, format: { with: /\A(0\d{9,10})\z/ }
  validates :prefecture_id, numericality: { other_than: 1 }
  def save
    record = Record.create(user_id: user_id, product_id: product_id)
    Customer.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, builing: builing, mobile: mobile,
                    record_id: record.id)
  end
end
