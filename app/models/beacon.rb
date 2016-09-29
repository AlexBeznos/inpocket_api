class Beacon < ApplicationRecord
  include Filterable

  belongs_to :place

  scope :by_place_id, -> (place_id) {
    where(place_id: place_id )
  }

  default_value_for :uuid do
    SecureRandom.uuid
  end

  validates :uuid, uniqueness: true
end
