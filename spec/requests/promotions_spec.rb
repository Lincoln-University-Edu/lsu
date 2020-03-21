require 'rails_helper'

RSpec.describe 'Promotions API', type: :request do
  let!(:promotions) { create_list(:promotion, 10) }
  let(:promotion) { promotions.first }
  let(:user) { promotion.user }

  describe 'GET /promotions' do
    before { get '/promotions', headers: valid_headers }

    it 'should return all promotions' do
      expect(json.size).to eq(10)
    end
    
    it 'should return status of 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /promotions' do
    context 'with valid parameters' do
      before { post '/promotions', params: valid_promotion_params, headers: valid_headers }
      it 'should create an promotion' do
        expect(json).not_to be_empty
      end

      it 'should return status of 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid parameters' do
      before { post "/promotions", params: invalid_promotion_params, headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Validation failed: Title can't be blank/)
      end

      it 'should return status of 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /promotions/:id' do
    context 'with valid parameters' do
      before { put "/promotions/#{promotion.id}", params: valid_promotion_params, headers: valid_headers }
      it 'should return status of 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid parameters' do
      before { put "/promotions/300", params: valid_promotion_params, headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Couldn't find Promotion with 'id'=300/)
      end

      it 'should return status of 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'DELETE /promotions/:id' do
    context 'with valid parameters' do
      before { delete "/promotions/#{promotion.id}", headers: valid_headers }
      it 'should return status of 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid parameters' do
      before { delete "/promotions/300", headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Couldn't find Promotion with 'id'=300/)
      end

      it 'should return status of 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

end