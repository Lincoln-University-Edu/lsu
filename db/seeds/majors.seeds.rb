10.times.each do
  Major.create!(name: Faker::Music.genre)
end