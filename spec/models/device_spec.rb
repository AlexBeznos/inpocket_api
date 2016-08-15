require 'rails_helper'

RSpec.describe Device, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:push_token) }
  it { is_expected.to validate_presence_of(:platform) }
  it { is_expected.to validate_presence_of(:user) }

  it 'should have valid factory' do
    expect(build(:device)).to be_valid
  end
end
