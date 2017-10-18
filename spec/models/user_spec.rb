require 'rails_helper'

RSpec.describe User, type: :model do

  it { is_expected.to have_many(:inventories).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
end
