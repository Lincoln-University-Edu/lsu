require 'rails_helper'

RSpec.describe 'StudentWires API', type: :request do
  let!(:student_wires) { create_list(:student_wire, 10) }
  let(:student_wire) { student_wires.first }
  let(:user) { create(:user) }

  describe 'GET /student_wires' do
    before { get '/student_wires', headers: valid_headers }

    it 'should return all student_wires' do
      expect(json['student_wires'].size).to eq(10)
    end
    
    it 'should return status of 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /student_wires' do
    context 'with valid parameters' do
      before { post '/student_wires', params: valid_student_wire_params, headers: valid_headers }
      it 'should create an student_wire' do
        expect(json['student_wire']).not_to be_empty
      end

      it 'should return status of 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid parameters' do
      before { post "/student_wires", params: invalid_student_wire_params, headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Validation failed: Contact can't be blank/)
      end

      it 'should return status of 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /student_wires/:id' do
    context 'with valid parameters' do
      before { put "/student_wires/#{student_wire.id}", params: valid_student_wire_params, headers: valid_headers }
      it 'should return status of 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid parameters' do
      before { put "/student_wires/300", params: valid_student_wire_params, headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Couldn't find StudentWire/)
      end

      it 'should return status of 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'DELETE /student_wires/:id' do
    context 'with valid parameters' do
      before { delete "/student_wires/#{student_wire.id}", headers: valid_headers }
      it 'should return status of 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid parameters' do
      before { delete "/student_wires/300", headers: valid_headers }
      it 'should raise an error' do
        expect(response.body).to match(/Couldn't find StudentWire/)
      end

      it 'should return status of 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

end