class PlaceCategory < ApplicationRecord
  has_many :places

  mount_uploader :image, PlaceCategoryImageUploader

  validates :name, presence: true
end
