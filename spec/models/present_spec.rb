require 'rails_helper'

RSpec.describe Present, type: :model do
  it { is_expected.to belong_to(:place) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:image) }
  it { is_expected.to validate_presence_of(:price) }

  it 'should have valid factory' do
    expect(build(:present)).to be_valid
  end
end
