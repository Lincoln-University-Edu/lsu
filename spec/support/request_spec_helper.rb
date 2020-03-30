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
      start_time: Time.now,
      end_time: (Time.now+10),
      location: "The earth",
      price: 2.33, 
      external_link: "somefancyurl.com",
      event_keywords: "some, fancy, keywords",
      event_category: "the best",
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
      article_category: "Some random category",
    }
  end

  def invalid_article_params
    params = valid_article_params
    params["author_name"] = ""
  end

  def valid_academic_event_params
    {
      start_time: Date.today,
      end_time: (Time.now+10),
      name: "Some fancy name",
      description: "Some fancy description",
      location: "here",
    }
  end

  def invalid_academic_event_params
    params = valid_academic_event_params
    params['name'] = ""
    params
  end

  def valid_major_params
    {
      name: "Some fancy name",
    }
  end

  def invalid_major_params
    {
      name: "",
    }
  end

  def valid_promotion_params
    user = User.create!(valid_user_params)
    {
      title: "Some title",
      description: "Some sample description",
      email: "some@email.com",
      phone_number: "1283104123",
      price: "2.33",
      promotion_category: "Some category",
      condition: "Some condition",
      promotion_image_urls: "url1.com, url2.com, url3.com",
      user: user,
    }
  end

  def invalid_promotion_params
    params = valid_promotion_params
    params["title"] = ""
    params
  end

  def valid_student_wire_params
    {
      contact: "contact@me.com",
      title: "Some fancy title",
      body: "Some body text",
      cover_image: "cover@image.com",
      external_link: "external@link.com",
      student_wire_keywords: "keyword1, keyword2"
    }
  end

  def invalid_student_wire_params
    params = valid_student_wire_params
    params['contact'] = ""
    params
  end
end