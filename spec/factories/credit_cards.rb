FactoryBot.define do
  factory :credit_card do
    payjp_customer_id {Faker::Internet.password(min_length: 8)}
    payjp_card_id {Faker::Internet.password(min_length: 8)}
    user
  end
end
