FactoryBot.define do
  factory :entity do
    name { Faker::Movies::StarWars.character }
    description { Faker::Movies::StarWars.quote } 
    email { Faker::Internet.email }
    phone_number { Faker::PhoneNumber.cell_phone }
    location { Faker::Movies::StarWars.planet }
    entity_social_accounts { [{ social_type: "twitter", detail: "@entity" }, { social_type: "twitter", detail: "@entity" }] }
  end
end