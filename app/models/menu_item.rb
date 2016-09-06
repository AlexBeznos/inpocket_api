class MenuItem < ApplicationRecord
  include Paginatable
  include Filterable

  mount_base64_uploader :image, BaseUploader

  belongs_to :menu_category

  scope :by_day_item, -> (day_item) { where(day_item: day_item) }
  scope :by_menu_category_id, -> (menu_category_id) {
    where(menu_category_id: menu_category_id)
  }
  scope :by_place_id, -> (place_id) {
    joins(:menu_category).where(menu_categories: { place_id: place_id })
  }

  validates :name, :image, :description, :menu_category, presence: true
end
