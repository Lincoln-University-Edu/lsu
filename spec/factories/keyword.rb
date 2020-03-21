FactoryBot.define do
  factory :keyword do
    name { Faker::Movies::StarWars.planet }
  end
end