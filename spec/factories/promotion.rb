FactoryBot.define do
  factory :promotion do
    user
    title { Faker::Movie.quote }
    description { Faker::Movies::StarWars.quote }
    email { Faker::Internet.email }
    phone_number { Faker::PhoneNumber.cell_phone }
    price { 2.33 }
    promotion_category { Faker::Music.genre }
    promotion_image_urls { "url1.com, url2.com, url3.com, url4.com" }
    condition { Faker::Movies::StarWars.quote }
  end
end