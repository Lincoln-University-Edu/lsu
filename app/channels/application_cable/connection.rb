module ApplicationCable
  class Connection < ActionCable::Connection::Base
    include ActionController::Cookies

    if cookies.signed[:user_id] && current_user = User.find_by!(id: cookies.signed[:user_id])
      current_user
    else
      reject_unauthorized_connection
    end
  end
end
