require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:user) { create(:user) }
  let(:lincolnian_article) { create(:lincolnian_article) }
  let(:lincoln_press_article) { create(:lincoln_press_article) }
  let(:article_params) { valid_article_params }
  
  before do
    request.headers['Authorization'] = token_generator(user.id)
  end

  describe '#create' do
    context 'when article is lincolnian' do
      context 'when user is not lincolnian Publisher' do
        before do
          user.update_attribute(:is_lincolnian_publisher, false)
          post :create, params: attributes_for(:lincolnian_article)
        end
  
        it 'should raise error' do
          expect(response.body).to match(/You are not a Lincolnian Publisher/)
        end
  
        it 'should return status 401' do
          expect(response).to have_http_status(401)
        end
      end
    end

    context 'when article is lincoln press' do
      context 'when user is not a Lincoln Press Publisher' do
        before do
          user.update_attribute(:is_lincoln_press_publisher, false)
          article_params['article_category'] = "Lincoln Press"
          post :create, params: attributes_for(:lincoln_press_article)
        end
  
        it 'should raise error' do
          expect(response.body).to match(/You are not a Lincoln Press Publisher/)
        end
  
        it 'should return status 401' do
          expect(response).to have_http_status(401)
        end
      end
    end
  end

  describe '#update' do

    context 'when article is lincolnian' do
      context 'when user is not lincolnian Publisher' do
        before do
          user.update_attribute(:is_lincolnian_publisher, false)
          put :update, params: { id: lincolnian_article.id, title: "some new title" }
        end
  
        it 'should raise error' do
          expect(response.body).to match(/You are not a Lincolnian Publisher/) 
        end
  
        it 'should return status 401' do
          expect(response).to have_http_status(401)
        end
      end
    end

    context 'when article is lincoln press' do
      context 'when user is not a Lincoln Press Publisher' do
        before do
          user.update_attribute(:is_lincoln_press_publisher, false)
          put :update, params: { id: lincoln_press_article.id, title: "some new title" }
        end
  
        it 'should raise error' do
          expect(response.body).to match(/You are not a Lincoln Press Publisher/)
        end
  
        it 'should return status 401' do
          expect(response).to have_http_status(401)
        end
      end
    end
  end

  describe '#destroy' do
   
    context 'when article is lincolnian' do
      context 'when user is not lincolnian Publisher' do
        before do
          user.update_attribute(:is_lincolnian_publisher, false)
          delete :destroy, params: { id: lincolnian_article.id }
        end
  
        it 'should raise error' do
          expect(response.body).to match(/You are not a Lincolnian Publisher/)
        end
  
        it 'should return status 401' do
          expect(response).to have_http_status(401)
        end
      end
    end

    context 'when article is lincoln press' do
      context 'when user is not a Lincoln Press Publisher' do
        before do
          user.update_attribute(:is_lincoln_press_publisher, false)
          delete :destroy, params: { id: lincoln_press_article.id }
        end
  
        it 'should raise error' do
          expect(response.body).to match(/You are not a Lincoln Press Publisher/)
        end
  
        it 'should return status 401' do
          expect(response).to have_http_status(401)
        end
      end
    end
  end
end
