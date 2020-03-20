FactoryBot.define do
  factory :user do
    first_name { Faker::Movies::StarWars.character.split(' ')[0] }
    last_name { Faker::Movies::StarWars.character.split(' ')[0] }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    student_class { 2019 }
  end
end