require 'rails_helper'

RSpec.describe AuthenticateUser do
  let(:user) { create(:user) }
  subject(:auth_obj) { described_class.new(user.email, user.password) }
  subject(:invalid_auth_obj) { described_class.new() }

  describe '#call' do
    context 'with valid credentials' do
      it 'should return a valid user and auth token' do
        result = auth_obj.call
        expect(result[:auth_token]).not_to be_nil
      end
    end

    context 'with invalid credentials' do
      it 'should raise an Authentication Error' do
        expect { invalid_auth_obj.call }
          .to raise_error(
            ExceptionHandler::AuthenticationError,
            /Invalid Credentials/
          )
      end
    end
  end
end