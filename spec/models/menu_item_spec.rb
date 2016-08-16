require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  it { is_expected.to belong_to(:menu_category) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:menu_category) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:image) }

  it 'should have valid factory' do
    expect(build(:menu_item)).to be_valid
  end
end
