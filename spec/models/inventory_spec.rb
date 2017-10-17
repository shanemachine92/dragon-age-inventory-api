require 'rails_helper'

RSpec.describe Inventory, type: :model do
  let(:inventory) { Inventory.new(title: nil, created_by: nil) }

  it { is_expected.to have_many(:items).dependent(:destroy) }

  it 'validates presence of title' do
    expect(inventory).to_not be_valid
  end

  it 'validates presence of created_by' do
    expect(inventory).to_not be_valid
  end
end
