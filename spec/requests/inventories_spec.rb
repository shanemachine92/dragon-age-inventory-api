require 'rails_helper'

RSpec.describe 'Dragon Age Inventories API', type: :request do
  let(:user) { create(:user) }
  let!(:inventories) { create_list(:inventory, 10, created_by: user.id) }
  let(:inventory_id) { inventories.first.id }

  describe 'GET /inventories' do
    before { get '/inventories', params: {} }

    it 'returns inventories' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code of 200' do
      expect(response).to have_http_status(200)
    end
  end
  
  describe 'GET /inventories/:id' do
    before { get "/inventories/#{inventory_id}", params: {} }

    context 'when the record exists' do
      it 'returns the inventory' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(inventory_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:inventory_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Inventory/)
      end
    end
  end

  describe 'POST /inventories' do
    let(:valid_attributes) { { title: 'Pointy_Things', created_by: 'Harry_Potter' }.to_json }

    context 'when the request is valid' do
      before { post '/inventories', params: valid_attributes }

      it 'creates an inventory' do
        expect(json['title']).to eq('Pointy Things')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/inventories', params: valid_attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Created by can't be blank/)
      end
    end
  end

  describe 'PUT /inventories/:id' do
    let(:valid_attributes) { { title: 'Shields' }.to_json }

    context 'when the record exists' do
      before { put "/inventories/#{inventory_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /inventories/:id' do
    before { delete "/inventories/#{inventory_id}", params: {} }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
