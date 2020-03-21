FactoryBot.define do
  factory :event do
    entity
    start_time { Faker::Date.forward(days: 23) }
    end_time { Faker::Date.forward(days: 24) }
    name { Faker::Book.title }
    description { Faker::Movies::StarWars.quote }
    location { Faker::Movies::StarWars.planet }
    price { 2.33 }
    external_link { Faker::Internet.url }
    category { Faker::Music.genre }
    event_keywords { "some, fancy, event, keywords" }
  end
end