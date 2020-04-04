FactoryBot.define do
  factory :user do
    first_name { Faker::Movies::StarWars.character.split(' ')[0] }
    last_name { Faker::Movies::StarWars.character.split(' ')[0] }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    student_class { 2019 }
    completed_registration { true }
    is_lincoln_press_publisher { true }
    is_student_wire_editor { true }
    is_athletic_event_publisher { true }
    is_academic_event_publisher { true }
    is_student_life_event_publisher { true }
    is_lincolnian_publisher { true }
  end
end