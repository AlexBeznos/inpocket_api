class PlaceImage < ApplicationRecord
  belongs_to :place

  mount_uploader :image, BaseUploader

  validates :image, presence: true
end
