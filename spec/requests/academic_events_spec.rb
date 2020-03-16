require 'rails_helper'

RSpec.describe 'AcademeicEvents API', type: :request do
  let!(:academic_events) { create_list(:academic_evemt, 10) }
  let(:academic_evemt) { AcademeicEvents.first }

  describe 'GET /academeic_events' do
    before { get '/academeic_events' }

    it 'should return all AcademeicEvents' do
      expect(json.size).to eq(10)
    end
    
    it 'should return status of 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /academeic_events' do
    context 'with valid parameters' do
      before { post '/academeic_events', params: valid_academic_event_params }
      it 'should create an academic_evemt' do
        expect(json).not_to be_empty
      end

      it 'should return status of 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid parameters' do
      before { post "/academic_events", params: invalid_academic_event_params }
      it 'should raise an error' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end

      it 'should return status of 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /academeic_events/:id' do
    context 'with valid parameters' do
      before { put "/academic_events/#{academic_evemt.id}", params: valid_academic_event_params }
      it 'should return status of 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid parameters' do
      before { put "/academic_events/300", params: valid_academic_event_params }
      it 'should raise an error' do
        expect(response.body).to match(/Couldn't find Academic evemt/)
      end

      it 'should return status of 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'DELETE /academeic_events/:id' do
    context 'with valid parameters' do
      before { delete "/academic_events/#{academic_evemt.id}" }
      it 'should return status of 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid parameters' do
      before { delete "/academic_events/300" }
      it 'should raise an error' do
        expect(response.body).to match(/Couldn't find Academic evemt/)
      end

      it 'should return status of 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

end