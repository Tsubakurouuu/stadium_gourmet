FactoryBot.define do
  factory :item do
    name { Faker::Lorem.characters(number:10) }
    explanation { Faker::Lorem.characters(number:30) }
  end
end