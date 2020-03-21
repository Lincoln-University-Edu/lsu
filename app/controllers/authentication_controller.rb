class AuthenticationController < ApplicationController
  skip_before_action :authorize_request

  def login
    result = AuthenticateUser.new(params[:email], params[:password]).call
    json_response(result)
  end
end