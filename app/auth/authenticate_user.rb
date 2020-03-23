class AuthenticateUser
  def initialize(email=nil, password=nil)
    @email = email
    @password = password
  end

  def call
    authorized_credentials
  end


  private
  attr_reader :email, :password

  def authorized_credentials
    @user = User.find_by(email: email)

    if @user && @user.authenticate(password)
      auth_token = JsonWebToken.encode(user_id: @user.id)

      return HashWithIndifferentAccess.new(user: @user.as_json(except: [:password_digest]), auth_token: auth_token)
    end

    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end