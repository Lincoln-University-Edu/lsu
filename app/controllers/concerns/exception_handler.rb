module ExceptionHandler
  extend ActiveSupport::Concern

  class InvalidToken < StandardError; end
  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
  end

  private
  def four_twenty_two(e)
    json_response({message: e.message}, :unprocessable_entity)
  end

  def record_not_found(e)
    json_response({message: e.message}, :not_found)
  end

  def unauthorized_request(e)
    json_response({message: e.message}, :unauthorized )
  end
end