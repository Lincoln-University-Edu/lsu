require 'rails_helper'

RSpec.describe AuthorizeApiRequest do
  let(:user) { create(:user) }
  let(:headers) { { 'Authorization' => token_generator(user.id) } }
  subject(:valid_request_obj) { described_class.new(headers) }
  subject(:invalid_request_obj) { described_class.new({}) }

  describe '#call' do
    context 'with valid headers' do
      it 'should return a valid user' do
        result = valid_request_obj.call
        expect(result['user']).to eq(user)
      end
    end

    context 'with invalid authentication token' do
      
      context 'with missing authentication token' do
        it 'should raise missing error' do
          expect {invalid_request_obj.call}
            .to raise_error(ExceptionHandler::MissingToken, /Missing Token/)          
        end
      end
  
      context 'with invalid token' do
        subject(:invalid_request_obj) { described_class.new('Authorization' => token_generator(5)) }
        it 'should raise invalid token error' do
          expect {invalid_request_obj.call}
            .to raise_error(ExceptionHandler::InvalidToken, /Invalid Token/)
        end
      end
  
      context 'with expired authentication token' do
        subject(:invalid_request_obj) { described_class.new('Authorization' => expired_token_generator(user.id)) }

        it 'should raise expired signature error' do
          expect { invalid_request_obj.call }
            .to raise_error(ExceptionHandler::InvalidToken, /Signature has expired/)
        end
      end

      context 'with fake token' do
        subject(:invalid_request_obj) { described_class.new('Authorization' => 'foobar') }
        it 'should handle JWT::DecodeError' do
          expect { invalid_request_obj.call }
            .to raise_error(ExceptionHandler::InvalidToken, /Invalid Token/)
        end
      end

    end

  end
end