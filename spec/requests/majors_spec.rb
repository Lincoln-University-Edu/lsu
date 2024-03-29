require 'rails_helper'

RSpec.describe 'Majors API', type: :request do
  let!(:majors) { create_list(:major, 10) }
  let(:major) { majors.first }
  let(:user) { create(:user) }

  describe 'GET /majors' do
    before { get '/majors', headers: valid_headers }

    it 'should return all Majors' do
      expect(json['majors'].size).to eq(10)
    end
    
    it 'should return status of 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /majors' do
    context 'with valid parameters' do
      before { post '/majors', params: valid_major_params, headers: valid_headers }
      it 'should create an major' do
        expect(json['major']).not_to be_empty
      end

      it 'should return status of 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid parameters' do
      before { post "/majors", params: invalid_major_params, headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end

      it 'should return status of 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /majors/:id' do
    context 'with valid parameters' do
      before { put "/majors/#{major.id}", params: valid_major_params, headers: valid_headers }
      it 'should return status of 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid parameters' do
      before { put "/majors/300", params: valid_major_params, headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Couldn't find Major/)
      end

      it 'should return status of 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'DELETE /majors/:id' do
    context 'with valid parameters' do
      before { delete "/majors/#{major.id}", headers: valid_headers }
      it 'should return status of 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid parameters' do
      before { delete "/majors/300", headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Couldn't find Major/)
      end

      it 'should return status of 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

end