FactoryBot.define do
  factory :item do
    name             { 'aaaa' }
    description_item { 'aaaa' }
    category_id      { 1 }
    condition_id     { 1 }
    shopping_fee_id  { 1 }
    prefecture_id    { 1 }
    schedule_item_id { 1 }
    price            { 300 }

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
