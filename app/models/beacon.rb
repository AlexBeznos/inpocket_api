class Beacon < ApplicationRecord
  belongs_to :place

  default_value_for :uuid do
    SecureRandom.uuid
  end

  validates :uuid, uniqueness: true
end
