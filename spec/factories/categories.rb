FactoryBot.define do
  factory :category do
    name {Faker::Games::Pokemon.name}
  end
end
