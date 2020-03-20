module ControllerSpecHelper
  def token_generator(user_id)
    JsonWebToken.encode(user_id: user_id)
  end

  def expired_token_generator(user_id)
    JsonWebToken.encode({user_id: user_id}, (Time.now.to_i - 20))
  end

  def valid_headers
    {
      Authorization: token_generator(user.id)
    }
  end
end