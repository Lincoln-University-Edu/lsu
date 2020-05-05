FactoryBot.define do
  factory :past_event, parent: :event do
    start_time { Faker::Date.backward(days: 24) }
  end
end