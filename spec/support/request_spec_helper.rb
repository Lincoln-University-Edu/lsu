module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end

  def valid_user_params
    { 
      first_name: "The Real",
      last_name: "Master Yoda",
      email: "email@address.com",
      password: "samplePassword",
      student_class: 2019,
    }
  end


  def invalid_user_params
    params = valid_user_params
    params["email"] = ""
    params
  end

  def valid_event_params
    { 
      name: "A name",
      description: "A description",
      entity: Entity.create!(valid_entity_params),
      datetime: Time.now,
      location: "The earth",
      price: 2.33, 
      external_link: "somefancyurl.com",
      evemt_keywords: "A string",
      category: "the best",
    }
  end

  def invalid_event_params
    params = valid_event_params
    params["title"] = ""
    params
  end

  def valid_entity_params
    {
      name: "A name",
      description: "A description",
      email: "anemail@email.com",
      phone_number: 23401924,
      location: "world",
    }
  end

  def invalid_entity_params
    {
      name: "",
      description: "A description",
      email: "anemail@email.com",
      phone_number: 23401924,
      location: "world",
    }
  end
  
end