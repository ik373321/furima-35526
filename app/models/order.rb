class Order 
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:city,:block,:builing,:mobile,:user_id,:product_id,:token

  # ここにバリデーションの処理を書く
  validates :postal_code,:prefecture_id,:city,:block,:mobile,:user_id,:product_id,:token, presence: true
  def save
    # 各テーブルにデータを保存する処理を書く
    record = Record.create(user_id:user_id,product_id:product_id)
    #binding.pry
    Customer.create(postal_code:postal_code,prefecture_id:prefecture_id,city:city,block:block,builing:builing,mobile:mobile,record_id:record.id)
  end

  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }

  validates :mobile,format:{with: /\A(0\d{9,10})\z/ }
  #/A([0-9]{10,11})Z/ 
  
end
   
 