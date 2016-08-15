require 'rails_helper'

RSpec.describe MenuCategory, type: :model do
  it { is_expected.to belong_to(:place) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:place) }

  it 'should have valid factory' do
    expect(build(:beacon)).to be_valid
  end
end
