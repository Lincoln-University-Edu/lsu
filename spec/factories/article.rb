FactoryBot.define do
  factory :article do
    author_name { Faker::Movies::StarWars.character }
    title { Faker::Music.album }
    description { Faker::Movies::StarWars.quote }
    body { Faker::Lorem.paragraphs(number: 10) }
    cover_image { Faker::Internet.url }
    article_keywords { "the best, the greatest, one more time" }
    category { Faker::Music.genre }
  end
end