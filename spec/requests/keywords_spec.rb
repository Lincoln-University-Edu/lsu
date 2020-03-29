require 'rails_helper'

RSpec.describe 'Keywords API', type: :request do
  let!(:keywords) { create_list(:keyword, 10) }
  let!(:keyword) { keywords.first }
  let(:user) { create(:user) }

  describe 'GET /keywords' do
    before { get '/keywords', headers: valid_headers }

    it 'should return all Keywords' do
      expect(json['keywords'].size).to eq(10)
    end
    
    it 'should return status of 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /keywords' do
    context 'with valid parameters' do
      before { post '/keywords', params: { name: "Name" }, headers: valid_headers }
      it 'should create an keyword' do
        expect(json['keyword']).not_to be_empty
      end

      it 'should return status of 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid parameters' do
      before { post "/keywords", params: {name: ""}, headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end

      it 'should return status of 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /keywords/:id' do
    context 'with valid parameters' do
      before { put "/keywords/#{keyword.id}", params: { name: "Name" }, headers: valid_headers }
      it 'should return status of 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid parameters' do
      before { put "/keywords/300", params: { name: "Name" }, headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Couldn't find Keyword/)
      end

      it 'should return status of 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'DELETE /keywords/:id' do
    context 'with valid parameters' do
      before { delete "/keywords/#{keyword.id}", headers: valid_headers }
      it 'should return status of 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid parameters' do
      before { delete "/keywords/300", headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Couldn't find Keyword/)
      end

      it 'should return status of 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

end