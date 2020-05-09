require 'rails_helper'

RSpec.describe 'Search API', type: :request do
  let(:user) { create(:user) }

  describe 'GET /search_academic_events' do
    context 'when successful' do
      before { post '/search_academic_events', headers: valid_headers }
      
      it 'should return success message' do
        expect(json['message'])
          .to match(/Search Successful, results are on the way through your action cable connection!/)
      end
    end
  end

  describe 'GET /search_entities' do
    context 'when successful' do
      before { post '/search_entities', headers: valid_headers }

      it 'should return success message' do
        expect(json['message'])
          .to match(/Search Successful, results are on the way through your action cable connection!/)
      end
    end
  end

  describe 'GET /search_articles' do
    context 'when successful' do
      before { post '/search_articles', headers: valid_headers }

      it 'should return success message' do
        expect(json['message'])
          .to match(/Search Successful, results are on the way through your action cable connection!/)
      end
    end
  end

  describe 'GET /search_promotions' do
    context 'when successful' do
      before { post '/search_promotions', headers: valid_headers }

      it 'should return success message' do
        expect(json['message'])
          .to match(/Search Successful, results are on the way through your action cable connection!/)
      end
    end
  end

  describe 'GET /search_events' do
    context 'when successful' do
      before { post '/search_events', headers: valid_headers }

      it 'should return success message' do
        expect(json['message'])
          .to match(/Search Successful, results are on the way through your action cable connection!/)
      end
    end
  end

  describe 'GET /search_users' do
    context 'when successful' do
      before { post '/search_users', headers: valid_headers }

      it 'should return success message' do
        expect(json['message'])
          .to match(/Search Successful, results are on the way through your action cable connection!/)
      end
    end
  end

  describe 'GET /search_student_wires' do
    context 'when successful' do
      before { post '/search_student_wires', headers: valid_headers }

      it 'should return success message' do
        expect(json['message'])
          .to match(/Search Successful, results are on the way through your action cable connection!/)
      end
    end
  end
end