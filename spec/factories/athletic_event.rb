FactoryBot.define do
  factory :athletic_event, parent: :event do
    event_category { "Athletic" }
  end
end