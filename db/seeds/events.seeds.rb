require 'faker'

10.times.each do 
  entity_params = {
    name: "A name",
    description: "A description",
    email: "anemail@email.com",
    phone_number: 23401924,
    location: "world",
  }

  entity = Entity.create!(entity_params)
  category = Category.create!({name: Faker::Music.genre})

  Event.create!(
    start_time: Faker::Date.forward(days: 23),
    end_time: Faker::Date.forward(days: 24),
    name: Faker::Book.title,
    description: Faker::Movies::StarWars.quote,
    location: Faker::Movies::StarWars.planet,
    price: 2.33,
    external_link: Faker::Internet.url,
    article_category: "Student Life",
    event_keywords: "some, fancy, event, keywords",
    entity_id: entity.id
  )
end