require 'rails_helper'

RSpec.describe User, type: :model do
  context 'if signed' do
    before { allow(subject).to receive(:signed).and_return(true) }

    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end

  context 'if not signed' do
    before { allow(subject).to receive(:signed).and_return(false) }

    it { is_expected.not_to validate_presence_of(:first_name) }
    it { is_expected.not_to validate_presence_of(:last_name) }
  end

  it 'should have valid factory' do
    expect(build(:user)).to be_valid
  end
end
