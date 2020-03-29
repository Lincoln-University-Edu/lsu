require 'rails_helper'

RSpec.describe 'Categories API', type: :request do
  let!(:categories) { create_list(:category, 10) }
  let!(:category) { categories.first }
  let(:user) { create(:user) }

  describe 'GET /categories' do
    before { get '/categories', headers: valid_headers }

    it 'should return all categories' do
      expect(json['categories'].size).to eq(10)
    end
    
    it 'should return status of 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /categories' do
    context 'with valid parameters' do
      before { post '/categories', params: { name: "Name" }, headers: valid_headers }
      it 'should create an category' do
        expect(json['category']).not_to be_empty
      end

      it 'should return status of 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid parameters' do
      before { post "/categories", params: {name: ""}, headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end

      it 'should return status of 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /categories/:id' do
    context 'with valid parameters' do
      before { put "/categories/#{category.id}", params: { name: "Name" }, headers: valid_headers }
      it 'should return status of 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid parameters' do
      before { put "/categories/300", params: { name: "Name" }, headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Couldn't find Category/)
      end

      it 'should return status of 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'DELETE /categories/:id' do
    context 'with valid parameters' do
      before { delete "/categories/#{category.id}", headers: valid_headers }
      it 'should return status of 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid parameters' do
      before { delete "/categories/300", headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Couldn't find Category/)
      end

      it 'should return status of 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

end