require 'rails_helper'

RSpec.describe 'Events API', type: :request do
  let!(:events) { create_list(:event, 10) }
  let(:event) { events.first }

  describe 'GET /events' do
    before { get '/events' }

    it 'should return all events' do
      expect(json.size).to eq(10)
    end
    
    it 'should return status of 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /events' do
    context 'with valid parameters' do
      before { post '/events', params: valid_event_params }
      it 'should create an event' do
        expect(json).not_to be_empty
      end

      it 'should return status of 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid parameters' do
      before { post "/events", params: invalid_event_params }
      it 'should raise an error' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end

      it 'should return status of 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /events/:id' do
    context 'with valid parameters' do
      before { put "/events/#{event.id}", params: valid_event_params }
      it 'should return status of 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid parameters' do
      before { put "/events/300", params: valid_event_params }
      it 'should raise an error' do
        expect(response.body).to match(/Couldn't find Event/)
      end

      it 'should return status of 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'DELETE /events/:id' do
    context 'with valid parameters' do
      before { delete "/events/#{event.id}" }
      it 'should return status of 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid parameters' do
      before { delete "/events/300" }
      it 'should raise an error' do
        expect(response.body).to match(/Couldn't find Event/)
      end

      it 'should return status of 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

end