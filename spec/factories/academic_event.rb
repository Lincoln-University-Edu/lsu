FactoryBot.define do
  factory :academic_event do
    datetime { Faker::Date.forward(days: 14) }
    name { Faker::Book.title }
    description { Faker::Movies::StarWars.quote }
    location { Faker::Movies::StarWars.planet }
  end
end 