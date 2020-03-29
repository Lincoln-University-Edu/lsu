require 'rails_helper'

RSpec.describe AcademicEventsController, type: :controller do

    let(:user) { create(:user) }
    let(:academic_event) { create(:academic_event) }  
  
    before do
      request.headers['Authorization'] = token_generator(user.id)
      user.update_attribute(:is_academic_event_publisher, false)
    end
  
    describe '#create' do
        before do
          params = attributes_for(:academic_event)
          post :create, params: params
        end
        
        context 'when user is not Academic Event publisher' do
          it 'should raise error' do
            expect(response.body).to match(/You are not an Academic Event Publisher/)
          end
  
          it 'should return status 401' do
            expect(response).to have_http_status(401)
          end
        end
    end
  
    describe '#update' do
      before do
        params = attributes_for(:academic_event)
        params[:id] = academic_event.id
        put :update, params: params
      end
      
      context 'when user is not Academic Event publisher' do
        it 'should raise error' do
          expect(response.body).to match(/You are not an Academic Event Publisher/)
        end

        it 'should return status 401' do
          expect(response).to have_http_status(401)
        end
      end
    end
  
    describe '#destroy' do  
      before do
        delete :destroy, params: { id: academic_event.id }
      end

      context 'when user is not Academic Event publisher' do
        it 'should raise error' do
          expect(response.body).to match(/You are not an Academic Event Publisher/)
        end

        it 'should return status 401' do
          expect(response).to have_http_status(401)
        end
      end
    end
end
