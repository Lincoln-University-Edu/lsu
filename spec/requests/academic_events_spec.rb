require 'rails_helper'

RSpec.describe 'AcademicEvents API', type: :request do
  let!(:academic_events) { create_list(:academic_event, 10) }
  let(:academic_event) { academic_events.first }
  let(:user) { create(:user) }

  describe 'GET /academic_events' do
    before { get '/academic_events', headers: valid_headers }

    it 'should return all AcademicEvents' do
      expect(json['academic_events'].size).to eq(10)
    end
    
    it 'should return status of 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /academic_events' do
    context 'with valid parameters' do
      before { post '/academic_events', params: valid_academic_event_params, headers: valid_headers }
      it 'should create an academic_event' do
        expect(json['academic_event']).not_to be_empty
      end

      it 'should return status of 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid parameters' do
      before { post "/academic_events", params: invalid_academic_event_params, headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end

      it 'should return status of 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'GET /academic_events/:id' do
    context 'when record exists' do
      before { get "/academic_events/#{academic_event.id}", headers: valid_headers }
      it 'should return status of 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when record does not exists' do
      before { get "/academic_events/#{300}", headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Couldn't find AcademicEvent/)
      end
    end
  end

  describe 'PUT /academic_events/:id' do
    context 'with valid parameters' do
      before { put "/academic_events/#{academic_event.id}", params: valid_academic_event_params, headers: valid_headers }
      it 'should return status of 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid parameters' do
      before { put "/academic_events/300", params: valid_academic_event_params, headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Couldn't find AcademicEvent/)
      end

      it 'should return status of 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'DELETE /academic_events/:id' do
    context 'with valid parameters' do
      before { delete "/academic_events/#{academic_event.id}", headers: valid_headers }
      it 'should return status of 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid parameters' do
      before { delete "/academic_events/300", headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Couldn't find AcademicEvent/)
      end

      it 'should return status of 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

end