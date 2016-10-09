class Share < ApplicationRecord
  include Paginatable
  include Filterable

  mount_base64_uploader :image, BaseUploader

  scope :by_place_id, -> (place_id) {
    where(place_id: place_id )
  }
  scope :by_places_exclusion, -> (place_ids) {
    not.where(place_id: place_ids.split(',') )
  }

  belongs_to :place

  validates :name, :image, :description, :place, presence: true
end
