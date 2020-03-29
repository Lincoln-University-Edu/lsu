require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:user) { create(:user) }
  let(:athletic_event) { create(:athletic_event) }
  let(:student_life_event) { create(:student_life_event) }
  let(:entity) { create(:entity) }


  before do
    request.headers['Authorization'] = token_generator(user.id)
  end

  describe '#create' do
    
    # When event is in student life category
    context 'when event is student life event' do
      before do
        user.update_attribute(:is_student_life_event_publisher, false)
        params = attributes_for(:student_life_event)
        params[:entity_id] = entity.id
        post :create, params: params
      end

      context 'when user is not student life event publihser' do
        it 'should raise error' do
          expect(response.body).to match(/You are not a Student Life Event Publisher/)
        end

        it 'should return status 401' do
          expect(response).to have_http_status(401)
        end
      end
    end

    # When event is in athletic category
    context 'when event is athlectic event' do
      before do
        user.update_attribute(:is_athletic_event_publisher, false)
        params = attributes_for(:athletic_event)
        params[:entity_id] = entity.id
        post :create, params: params
      end
      context 'when user is not athletic event publisher' do
        it 'should raise error' do
          expect(response.body).to match(/You are not an Athletic Event Publisher/)
        end

        it 'should return status 401' do
          expect(response).to have_http_status(401)
        end
      end
    end
  end

  describe '#update' do

    # When event is in student life category
    context 'when event is student life event' do
      before do
        user.update_attribute(:is_student_life_event_publisher, false)
        params = attributes_for(:student_life_event)
        params[:id] = student_life_event.id
        put :update, params: params
      end

      context 'when user is not student life event publihser' do
        it 'should raise error' do
          expect(response.body).to match(/You are not a Student Life Event Publisher/)
        end

        it 'should return status 401' do
          expect(response).to have_http_status(401)
        end
      end
    end

    # When event is in athletic category
    context 'when event is athlectic event' do
      before do
        user.update_attribute(:is_athletic_event_publisher, false)
        params = attributes_for(:athletic_event)
        params[:id] = athletic_event.id
        put :update, params: params
      end
      context 'when user is not athletic event publisher' do
        it 'should raise error' do
          expect(response.body).to match(/You are not an Athletic Event Publisher/)
        end

        it 'should return status 401' do
          expect(response).to have_http_status(401)
        end
      end
    end
  end

  describe '#destroy' do

    # When event is in student life category
    context 'when event is student life event' do
      before do
        user.update_attribute(:is_student_life_event_publisher, false)
        delete :destroy, params: { id: student_life_event.id }
      end

      context 'when user is not student life event publihser' do
        it 'should raise error' do
          expect(response.body).to match(/You are not a Student Life Event Publisher/)
        end

        it 'should return status 401' do
          expect(response).to have_http_status(401)
        end
      end
    end

    # When event is in athletic category
    context 'when event is athlectic event' do
      before do
        user.update_attribute(:is_athletic_event_publisher, false)
        delete :destroy, params: { id: athletic_event.id }
      end
      context 'when user is not athletic event publisher' do
        it 'should raise error' do
          expect(response.body).to match(/You are not an Athletic Event Publisher/)
        end

        it 'should return status 401' do
          expect(response).to have_http_status(401)
        end
      end
    end
  end
end
