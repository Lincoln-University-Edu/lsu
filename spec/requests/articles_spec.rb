require 'rails_helper'

RSpec.describe 'Articles API', type: :request do
  let!(:articles) { create_list(:article, 10) }
  let(:article) { articles.first }
  let(:user) { create(:user) }

  describe 'GET /articles' do
    before { get '/articles', headers: valid_headers }

    it 'should return all articles' do
      expect(json['articles'].size).to eq(10)
    end
    
    it 'should return status of 200' do
      expect(response).to have_http_status(200)
    end

    it 'should include article category' do
      expect(json['articles'].first['article_category']).not_to be_nil
    end
  end

  describe 'POST /articles' do
    context 'with valid parameters' do
      before { post '/articles', params: valid_article_params, headers: valid_headers }
      it 'should create an article' do
        expect(json['article']).not_to be_empty
      end

      it 'should return status of 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid parameters' do
      before { post "/articles", params: invalid_article_params, headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Validation failed: Author name can't be blank/)
      end

      it 'should return status of 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'GET /articles/:id' do
    context 'when the record exists' do
      before { get "/articles/#{article.id}", headers: valid_headers }
      it 'should return status of 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when record does not exists' do
      before { get "/articles/#{300}", headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Couldn't find Article/)
      end
    end
  end

  describe 'PUT /articles/:id' do
    context 'with valid parameters' do
      before { put "/articles/#{article.id}", params: valid_article_params, headers: valid_headers }
      it 'should return status of 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid parameters' do
      before { put "/articles/300", params: valid_article_params, headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Couldn't find Article/)
      end

      it 'should return status of 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'DELETE /articles/:id' do
    context 'with valid parameters' do
      before { delete "/articles/#{article.id}", headers: valid_headers }
      it 'should return status of 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid parameters' do
      before { delete "/articles/300", headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Couldn't find Article/)
      end

      it 'should return status of 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

end