require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { Item.new(name: nil, description: 'a hell of a gun', wielder: 'Mage', level: 14) }
  
  it { is_expected.to belong_to(:inventory) }

  it 'validates the presense of a name' do
    expect(item).to_not be_valid
  end
end
