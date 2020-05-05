20.times.each do
  Entity.create!(
    name: "A name",
    description: "A description",
    email: "anemail@email.com",
    phone_number: 23401924,
    location: "world",
    entity_social_accounts: [{ social_type: "twitter", detail: "@entity" }, { social_type: "twitter", detail: "@entity" }],
  )
end
