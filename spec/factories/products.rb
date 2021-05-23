FactoryBot.define do
  factory :product do
    name { '洋服' }
    details { 'aaaaaaaaaaaaaaaaaaaaaaaaa' }
    category_id { 3 }
    condition_id     { 2 }
    ship_method_id   { 2 }
    prefecture_id { 23 }
    day_ship_id { 2 }
    price { 10_000 }
    association :user
    after(:build) do |product|
      product.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png')
    end
  end
end
