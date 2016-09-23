class Share < ApplicationRecord
  include Paginatable
  include Filterable

  mount_base64_uploader :image, BaseUploader

  scope :by_place_id, -> (place_id) {
    where(place_id: place_id )
  }

  belongs_to :place

  validates :name, :image, :description, :place, presence: true
end
