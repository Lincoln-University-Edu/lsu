require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let!(:users) { create_list(:user, 10) }
  let(:user) { users.first }


  describe 'GET /users' do
    before { get '/users', headers: valid_headers }

    it 'should return all users' do
      expect(json['users'].size).to eq(10)
    end

    it 'should return status of 200' do
      expect(response).to have_http_status(200)
    end
  end
  
  describe 'POST /users' do
    
    context 'with valid attributes' do
      before { post '/users', params: valid_user_params, headers: valid_headers }

      it 'should create a user' do
        expect(json['user']['first_name']).to eq('The Real')
      end
  
      it 'should return status of 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid attributes' do
      before { post '/users', params: invalid_user_params, headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Validation failed: Email can't be blank/)
      end

      it 'should return status 422' do
        expect(response).to have_http_status(422)
      end
    end
    
  end

  describe 'GET /users/:id' do

    context 'when the record exists' do
      before { get "/users/#{user.id}", headers: valid_headers  }
      it 'should return status 200' do
        expect(response).to have_http_status(200)
      end
  
    end

    context "when the record doesn't exist" do
      before { get "/users/#{300}", headers: valid_headers  }
      it 'should return status 200' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end

  end

  describe 'GET /profile/:id' do

    context 'when the record exists' do
      before { get "/profile/#{user.id}", headers: valid_headers  }
      it 'should return status 200' do
        expect(response).to have_http_status(200)
      end

      it 'should return status 200' do
        expect(json['user']['email']).to eq(user.email)
      end
    end

    context "when the record doesn't exist" do
      before { get "/users/#{300}", headers: valid_headers  }
      it 'should return status 200' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end

  end

  describe 'PUT /users/:id' do

    context 'when the record exists' do
      before { put "/users/#{user.id}", params: { email: user.email, password: user.password, name: "The Real Yoda" }, headers: valid_headers  }
      it 'should update a user' do
        expect(response).to have_http_status(204)
      end
  
    end

    context "when the record doesn't exist" do
      before { put "/users/400", params: valid_user_params, headers: valid_headers  }
      it 'should raise an error' do
        expect(response.body).to match(/Couldn't find User/)
      end

      it 'should return status 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'DELETE /users/:id' do
    context 'when record exists' do
      before { delete "/users/#{user.id}", headers: valid_headers }
      
      it 'should delete the user' do
        expect(response).to have_http_status((204))
      end
    end

    context "when the record doesn't exist" do
      before { delete "/users/300", headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Couldn't find User/)
      end

      it 'should return status 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end