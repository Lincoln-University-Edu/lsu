require 'faker'

10.times.do 
  entity = Entity.create!(entity_params)

  Event.create!(
    start_time: Faker::Date.forward(days: 23),
    end_time: Faker::Date.forward(days: 24),
    name: Faker::Book.title,
    description: Faker::Movies::StarWars.quote,
    location: Faker::Movies::StarWars.planet,
    price: 2.33,
    external_link: Faker::Internet.url,
    category: Faker::Music.genre,
    event_keywords: "some, fancy, event, keywords",
    entity_id: entity.id
  )
end