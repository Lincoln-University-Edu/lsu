require 'rails_helper'

RSpec.describe 'Events API', type: :request do
  let!(:events) { create_list(:event, 10) }
  let(:event) { events.first }
  let(:user) { create(:user) }
  
  describe 'GET /events' do
    before { get '/events', headers: valid_headers }
    
    it 'should return all events' do
      expect(json['events'].size).to eq(10)
    end
    
    it 'should return status of 200' do
      expect(response).to have_http_status(200)
    end
    
    it 'should include entity' do
      expect(json['events'].first['entity']).not_to be_nil
    end

    it 'should include event category' do
      expect(json['events'].first['event_category']).not_to be_nil
    end
  end
  
  describe 'GET /past_events' do
    let!(:past_events) { create_list(:past_event, 10) }
    before { get '/past_events', headers: valid_headers }
    
    it 'should return all past events' do
      expect(json['events'].first['start_time']).to be < Time.now
      expect(json['events'].last['start_time']).to be < Time.now
    end
    
    it 'should return status of 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /upcoming_events' do
    before { get '/upcoming_events', headers: valid_headers }

    it 'should return all upcoming events' do
      expect(json['events'].last['start_time']).to be >= Time.now
      expect(json['events'].last['start_time']).to be >= Time.now
    end
    
    it 'should return status of 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /events' do
    context 'with valid parameters' do
      before { post '/events', params: valid_event_params, headers: valid_headers }
      it 'should create an event' do
        expect(json['event']).not_to be_empty
      end

      it 'should return status of 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid parameters' do
      before { post "/events", params: invalid_event_params, headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end

      it 'should return status of 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'GET /events/:id' do
    context 'when record exists' do
      before { get "/events/#{event.id}", headers: valid_headers }
      it 'should return status of 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when record does not exist' do
      before { get "/events/#{300}", headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Couldn't find Event/)
      end
    end
  end

  describe 'PUT /events/:id' do
    context 'with valid parameters' do
      before { put "/events/#{event.id}", params: valid_event_params, headers: valid_headers }
      it 'should return status of 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid parameters' do
      before { put "/events/300", params: valid_event_params, headers: valid_headers }
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
      before { delete "/events/#{event.id}", headers: valid_headers }
      it 'should return status of 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid parameters' do
      before { delete "/events/300", headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Couldn't find Event/)
      end

      it 'should return status of 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

end