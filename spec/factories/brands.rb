FactoryBot.define do
  factory :brand do
    name {Faker::Games::Pokemon.name}
  end
end
