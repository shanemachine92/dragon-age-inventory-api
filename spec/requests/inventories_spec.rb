require 'rails_helper'

RSpec.describe 'Dragon Age Inventories API', type: :request do

  let(:user) { User.create(email: 'shane@shane.com', password: 'password', password_confirmation: 'password') }
  let(:inventory) { Inventory.create(title: 'Testy', created_by: 'Tester') }
  let(:id) { inventory.id }
  let(:headers) { valid_headers }

  describe 'GET /inventories' do
    before { get '/inventories', params: {}, headers: headers }

    it 'returns status code of 200' do
      expect(response).to have_http_status(200)
    end
  end
  
  describe 'GET /inventories/:id' do
    before { get "/inventories/#{id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the inventory' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(inventory.id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let (:id) { 0 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST /inventories' do
    let(:valid_attributes) { { title: 'Pointy_Things', created_by: 'Harry_Potter' }.to_json }
    let(:invalid_attributes) { { title: nil, created_by: 'Harry_Potter' }.to_json }

    context 'when the request is valid' do
      before { post '/inventories', params: valid_attributes, headers: headers }

      it 'creates an inventory' do
        expect(json['title']).to eq('Pointy_Things')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/inventories', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'PUT /inventories/#{id}' do
    let(:valid_attributes) { { title: 'Shields' }.to_json }

    context 'when the record exists' do
      before { put "/inventories/#{id}", params: valid_attributes, headers: headers }

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /inventories/:id' do
    before { delete "/inventories/#{id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
