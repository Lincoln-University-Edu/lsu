require 'faker'

10.times.each do
  Keyword.create!(name: Faker::Music.genre)
end