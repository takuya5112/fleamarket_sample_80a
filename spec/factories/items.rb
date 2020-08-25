FactoryBot.define do
  factory :item do
    name {Faker::Games::Pokemon.name}
    introduction {Faker::Lorem.sentence}
    price {Faker::Number.between(from: 300, to: 100000)}
    category
    brand
    condition_id {Faker::Number.between(from: 1, to: 6)}
    postage_burden_id {Faker::Number.between(from: 1, to: 2)}
    prefecture_code {Faker::Number.between(from: 1, to: 47)}
    postage_days_id {Faker::Number.between(from: 1, to: 3)}
    seller_id {1}
    buyer_id {1}
    deal_done_date {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}

    after(:build) do |i|
      i.item_images << build(:item_image)
    end

  end
end
