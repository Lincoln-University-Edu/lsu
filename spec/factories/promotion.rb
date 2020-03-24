FactoryBot.define do
  factory :promotion do
    user
    title { Faker::Movie.quote }
    description { Faker::Movies::StarWars.quote }
    email { Faker::Internet.email }
    phone_number { Faker::PhoneNumber.cell_phone }
    price { 2.33 }
    promotion_category { Faker::Music.genre }
    condition { Faker::Movies::StarWars.quote }
  end
end