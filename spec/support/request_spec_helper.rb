module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end

  def valid_user_params
    { 
      name: "The Real Master Yoda",
      email: "email@address.com",
      password: "samplePassword"
    }
  end


  def invalid_user_params
    { 
      name: "",
      email: "",
      password: "samplePassword"
    }
  end
end