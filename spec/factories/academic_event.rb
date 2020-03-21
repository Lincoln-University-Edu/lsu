FactoryBot.define do
  factory :academic_event do
    start_time { Faker::Date.forward(days: 23) }
    end_time { Faker::Date.forward(days: 24) }
    name { Faker::Book.title }
    description { Faker::Movies::StarWars.quote }
    location { Faker::Movies::StarWars.planet }
  end
end 