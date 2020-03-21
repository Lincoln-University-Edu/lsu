class AuthenticationController < ApplicationController
  def login
    result = AuthenticateUser.new(params[:email], params[:password]).call
    json_response(result)
  end
end