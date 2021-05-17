FactoryBot.define do
  factory :product do
    name              {'洋服'}
    details                 {'aaaaaaaaaaaaaaaaaaaaaaaaa'}
    category_id            {3}
    condition_id     {2}
    ship_method_id   {2}
    prefecture_id {23}
    day_ship_id {2}
    price {10000}
    association :user
  end
end
