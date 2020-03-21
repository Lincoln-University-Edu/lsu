require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  let!(:user) { create(:user) }

  describe '#login' do
    context 'with valid credentials' do
      before { post 'login', params: { email: user.email, password: user.password } }
      it 'should return the user and auth token' do
        expect(json).not_to be_empty
        expect(json['user']).not_to be_nil
        expect(json['auth_token']).not_to be_nil
      end

      it 'should return status of 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'with invalid credentials' do
      before { post 'login', params: { email: "foo@bar.com", password: "bar" } }
      it 'should raise ExceptionHandler::Authentication error' do
        expect(response.body).to match(/Invalid Credentials/)
      end

      it 'should return status of 401' do
        expect(response).to have_http_status(401)
      end
    end
  end
end