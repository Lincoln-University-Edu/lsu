FactoryBot.define do
  factory :student_wire do
    contact { Faker::Movies::StarWars.character }
    title { Faker::Movies::StarWars.planet }
    body { Faker::Movies::StarWars.quote }
    cover_image { Faker::Internet.url }
    external_link { Faker::Internet.url }
    student_wire_keywords { "keyword1, keyword2" }
  end
end