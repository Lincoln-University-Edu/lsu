

10.times.each do |count|
  user = User.create!(
    first_name: "The Real",
    last_name: "Master Yoda",
    email: "email#{count}@address.com",
    password: "samplePassword",
    student_class: 2019,
  )

  if count % 2 == 0 
    condition = "New"
    promotion_category = "Electronics"
  else
    condition = "Used"
    promotion_category = "Eductional"
  end

  Promotion.create!(
    title: "Some title",
    description: "Some sample description",
    email: "some@email.com",
    phone_number: "1283104123",
    price: "2.33",
    promotion_category: "Some category",
    condition: condition,
    user: user,
  )
end