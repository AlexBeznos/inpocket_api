class MenuCategory < ApplicationRecord
  belongs_to :place

  validates :name, :place, presence: true
end
