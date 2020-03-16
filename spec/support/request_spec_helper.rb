require 'rails_helper'

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
    entity = Entity.create!(valid_entity_params)
    { 
      description: "A description",
      name: "A name",
      entity_id: entity.id,
      datetime: Time.now,
      location: "The earth",
      price: 2.33, 
      external_link: "somefancyurl.com",
      event_keywords: "some, fancy, keywords",
      category: "the best",
    }
  end

  def invalid_event_params
    params = valid_event_params
    params["name"] = ""
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
    params = valid_entity_params
    params['name'] = ""
    params
  end
  
  def valid_article_params
    {
      author_name: "Some random name",
      title: "Some random title",
      body: "Some random bit of text",
      description: "Some random description",
      cover_image: "Some random bit of text",
      article_keywords: "Some, random, bit, of, text",
      category: "Some random category",
    }
  end

  def invalid_article_params
    params = valid_article_params
    params["author_name"] = ""
  end
end