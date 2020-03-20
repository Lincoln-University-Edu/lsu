FactoryBot.define do
  factory :promotion do
    user
    title { Faker::Movie.quote }
    description { Faker::Movies::StarWars.quote }
    email { Faker::Internet.email }
    phone_number { Faker::PhoneNumber.cell_phone }
    price { 2.33 }
    category { Faker::Movies::StarWars.planet }
    condition { Faker::Movies::StarWars.quote }
  end
end