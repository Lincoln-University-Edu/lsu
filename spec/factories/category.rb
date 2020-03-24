FactoryBot.define do
  factory :category do
    name { Faker::Music.genre }
  end
end