require 'rails_helper'

RSpec.describe StudentWiresController, type: :controller do
  let(:user) { create(:user) }
  let(:student_wire) { create(:student_wire) }
  
  before do
    request.headers['Authorization'] = token_generator(user.id)
    user.update_attribute(:is_student_wire_editor, false)
  end

  describe '#create' do
    before do
      post :create, params: valid_student_wire_params
    end

    context 'when user is not student wire editor' do
      it 'should raise error' do
        expect(response.body).to match(/You are not a student wire editor/)
      end

      it 'should return status 401' do
        expect(response).to have_http_status(401)
      end
    end
  end

  describe '#update' do

    before(:each) do
      put :update, params: { id: student_wire.id, title: "some new title" }
    end

    context 'when user is not student wire editor' do
      it 'should raise error' do
        expect(response.body).to match(/You are not a student wire editor/)
      end

      it 'should return status 401' do
        expect(response).to have_http_status(401)
      end
    end
  end

  describe '#destroy' do
    before do
      delete :destroy, params: { id: student_wire.id }
    end

    context 'when user is not student wire editor' do
      it 'should raise error' do
        expect(response.body).to match(/You are not a student wire editor/)
      end

      it 'should return status 401' do
        expect(response).to have_http_status(401)
      end
    end
  end
  
end