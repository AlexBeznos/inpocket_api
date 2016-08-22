class MenuCategory < ApplicationRecord
  belongs_to :place
  has_many :menu_items, dependent: :destroy

  validates :name, :place, presence: true
end
