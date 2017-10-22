require 'rails_helper'

RSpec.describe 'Items API' do

  let(:user) { User.create(email: 'shane@shane.com', password: 'password', password_confirmation: 'password') }
  let!(:inventory) { Inventory.create(title: 'something' , created_by: 'someone') }
  let(:item) { Item.create(name: 'Sharpy', description: 'sharp', wielder: 'warrior', level: 5, inventory_id: inventory.id) }
  let(:inventory_id) { inventory.id }
  let(:id) { item.id }
  let(:headers) { valid_headers }

  describe 'GET /inventories/:inventory_id/items' do
    before { get "/inventories/#{inventory_id}/items", params: {}, headers: headers }

    context 'when inventory exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when inventory does not exist' do
      let(:inventory_id) { 0 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'GET /inventories/:inventory_id/items/:id' do
    before { get "/inventories/#{inventory_id}/items/#{id}", params: {}, headers: headers }

    context 'when inventory item exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the item' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when inventory item does not exist' do
      let(:id) { 0 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST /inventories/:inventory_id/items' do
    let(:valid_attributes) { { name: 'Narnia', description: 'Best thing!', wielder: 'Mage', level: '12' }.to_json }
    let(:invalid_attributes) { { name: nil, description: 'Best thing!', wielder: 'Mage', level: '12' }.to_json }

    context 'when request attributes are valid' do
      before { post "/inventories/#{inventory_id}/items", params: valid_attributes, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/inventories/#{inventory_id}/items", params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /inventories/:inventory_id/items/:id' do
    let(:updated_attributes) { { name: 'DeathBringer' }.to_json }

    before { put "/inventories/#{inventory_id}/items/#{id}", params: updated_attributes, headers: headers }

    context 'when item exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'when the item does not exist' do

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'DELETE /inventories/:id' do
    before { delete "/inventories/#{inventory_id}/items/#{id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
