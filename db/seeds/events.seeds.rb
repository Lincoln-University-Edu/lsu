require 'faker'

10.times.each do |time|
  entity_params = {
    name: "A name",
    description: "A description",
    email: "anemail@email.com",
    phone_number: 23401924,
    location: "world",
    entity_image: "https://images.unsplash.com/photo-1588804185322-d3665667a428?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
  }

  entity = Entity.create!(entity_params)
  category = Category.create!({name: Faker::Music.genre})

  Event.create!(
    start_time: Faker::Date.forward(days: (2 * time)),
    end_time: Faker::Date.forward(days: (3 * time)),
    name: Faker::Book.title,
    description: Faker::Movies::StarWars.quote,
    location: Faker::Movies::StarWars.planet,
    price: 2.33,
    external_link: Faker::Internet.url,
    event_category: "Student Life",
    event_keywords: "some, fancy, event, keywords",
    entity_id: entity.id
  )

  Event.create!(
    start_time: Faker::Date.backward(days: (2 * time)),
    end_time: Faker::Date.backward(days: (3 * time)),
    name: Faker::Book.title,
    description: Faker::Movies::StarWars.quote,
    location: Faker::Movies::StarWars.planet,
    price: 2.33,
    external_link: Faker::Internet.url,
    event_category: "Student Life",
    event_keywords: "some, fancy, event, keywords",
    entity_id: entity.id
  )
end