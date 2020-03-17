FactoryBot.define do
  factory :major do
    name { Faker::Movies::StarWars.character }
  end
end