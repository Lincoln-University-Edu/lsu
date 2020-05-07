module ApplicationCable
  class Connection < ActionCable::Connection::Base
  include ExceptionHandler
  identified_by :current_user

  def connect
    self.current_user = authorize_request
  end

  private

  def authorize_request
    @current_user = AuthorizeApiRequest.new(request.params[:auth_token]).call[:user]
  end
  end
end
