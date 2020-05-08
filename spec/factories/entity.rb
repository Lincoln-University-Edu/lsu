FactoryBot.define do
  factory :entity do
    name { Faker::Movies::StarWars.character }
    description { Faker::Movies::StarWars.quote } 
    email { Faker::Internet.email }
    phone_number { Faker::PhoneNumber.cell_phone }
    location { Faker::Movies::StarWars.planet }
    is_organisation { true }
    entity_social_accounts { [{ social_type: "twitter", detail: "@entity" }, { social_type: "twitter", detail: "@entity" }] }
    entity_image { "https://images.unsplash.com/photo-1588804185322-d3665667a428?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" }
  end
end