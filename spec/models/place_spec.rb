require 'rails_helper'

RSpec.describe Place, type: :model do
  it_behaves_like 'with coloration', :color

  it { is_expected.to have_many(:beacons).dependent(:destroy) }
  it { is_expected.to have_many(:presents).dependent(:destroy) }
  it { is_expected.to have_many(:shares).dependent(:destroy) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:logo) }
  it { is_expected.to validate_presence_of(:address) }
  it { is_expected.to validate_inclusion_of(:color).in_array(Colorable::COLORS.keys) }

  it 'should have valid factory' do
    expect(build(:place)).to be_valid
  end
end
