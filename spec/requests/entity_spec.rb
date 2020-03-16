require 'rails_helper'

RSpec.describe 'Entities API', type: :request do
  let!(:entities) { create_list(:entity, 10) }
  let(:entity) { entities.first }
  let(:user) { create(:user) }

  describe 'GET /entities' do
    before { get '/entities' }

    it 'should return all Entities' do
      expect(json.size).to eq(10)
    end
    
    it 'should return status of 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /entities' do
    context 'with valid parameters' do
      before { post '/entities', params: valid_entity_params }
      it 'should create an entity' do
        expect(json).not_to be_empty
      end

      it 'should return status of 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid parameters' do
      before { post "/entities", params: invalid_entity_params }
      it 'should raise an error' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end

      it 'should return status of 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /entities/:id' do
    context 'with valid parameters' do
      before { put "/entities/#{entity.id}", params: valid_entity_params }
      it 'should return status of 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid parameters' do
      before { put "/entities/300", params: valid_entity_params }
      it 'should raise an error' do
        expect(response.body).to match(/Couldn't find Entity with 'id'=300/)
      end

      it 'should return status of 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'DELETE /entities/:id' do
    context 'with valid parameters' do
      before { delete "/entities/#{entity.id}" }
      it 'should return status of 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid parameters' do
      before { delete "/entities/300" }
      it 'should raise an error' do
        expect(response.body).to match(/Couldn't find Entity with 'id'=300/)
      end

      it 'should return status of 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  # Adding a user to an entity

  describe 'POST /entities/:id/users/new' do
    context 'with valid parameters' do
      before { post "/entities/#{entity.id}/users/new", params: { user_id: user.id } }

      it 'should add the entity to the list of entities for the user' do
        expect(entity.users.include?(user)).to eq(true)
      end

      it 'should return status of 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid parameters' do
      context 'when user is invalid' do
        before { post "/entities/#{entity.id}/users/new", params: { user_id: 300 } }
        it 'should raise an error' do
          expect(response.body).to match(/Couldn't find User/)
        end
      end
    end
  end

  #Deleting a user from an entity

  describe 'DELETE /entities/:id/users/:user_id' do
    context 'with valid parameters' do
      before { delete "/entities/#{entity.id}/users/#{user.id}"}

      it 'should delete the entity from the list of entities for the user' do
        expect(entity.users.include?(user)).to eq(false)
      end

      it 'should return status of 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid parameters' do
      context 'when user is invalid' do
        before { delete "/entities/#{entity.id}/users/#{300}" }
        it 'should raise an error' do
          expect(response.body).to match(/Couldn't find User/)
        end
      end
    end
  end

end