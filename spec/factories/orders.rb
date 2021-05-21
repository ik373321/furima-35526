FactoryBot.define do
  factory :order do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { "222-2222"}
    prefecture_id { 40 }
    city { "川崎" }
    block { "有馬 "}
    builing { "建物" }
    mobile { "09012345678" }
    product_id{1}
    user_id{2}
  end
end