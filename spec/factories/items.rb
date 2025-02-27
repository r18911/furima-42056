FactoryBot.define do
  factory :item do
    name              { 'テスト商品' }
    description       { 'テスト商品の説明です' }
    category_id       { Category.find(2).id }
    condition_id      { Condition.find(2).id }
    shipping_fee_id   { ShippingFee.find(2).id }
    prefecture_id     { Prefecture.find(2).id }
    shipping_day_id   { ShippingDay.find(2).id }
    price             { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
