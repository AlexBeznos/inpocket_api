require 'rails_helper'

RSpec.describe Feedback, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:place) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:place) }
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to validate_presence_of(:stars) }
  it { is_expected.to validate_inclusion_of(:stars).in_array((1..5).to_a) }

  it 'should validate user sign status'
end
