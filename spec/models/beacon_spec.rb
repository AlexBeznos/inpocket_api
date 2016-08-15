require 'rails_helper'

RSpec.describe Beacon, type: :model do
  it { is_expected.to validate_uniqueness_of(:uuid) }
  
  it 'should have valid factory' do
    expect(build(:beacon)).to be_valid
  end
end
