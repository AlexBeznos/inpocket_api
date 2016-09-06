class Order < ApplicationRecord
  include Paginatable
  include UnixTimeable

  default_scope { order(created_at: :desc) }

  scope :with_menu_items, -> { joins(:menu_items).distinct }

  unix_time :created_at
  
  belongs_to :user
  belongs_to :place

  has_many :order_menu_items, dependent: :destroy
  has_many :order_presents, dependent: :destroy

  has_many :menu_items, through: :order_menu_items
  has_many :presents, through: :order_presents
end
