class MenuItem < ApplicationRecord
  include Paginatable
  belongs_to :menu_category

  validates :name, :image, :description, :menu_category, presence: true
end
