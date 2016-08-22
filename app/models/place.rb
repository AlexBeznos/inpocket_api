class Place < ApplicationRecord
  include Colorable
  include Paginatable
  include Filterable

  colorate :color
  serialize :phones, Array
  serialize :images, Array
  serialize :working_hours, Hash

  has_many :beacons, dependent: :destroy
  has_many :presents, dependent: :destroy
  has_many :shares, dependent: :destroy
  has_many :menu_categories, dependent: :destroy

  scope :by_uuid, -> (uuid) { joins(:beacons).where("beacons.uuid in (?)", uuid) }

  geocoded_by :address, latitude: :lat, longitude: :lng

  validates :name, :description, :logo, :address, :working_hours, :site, :category, presence: true
  validates :color, inclusion: { in: Colorable::COLORS.keys }

  def present_received?(user)
    DebutPresentRelation.exists?(place_id: id, user_id: user.id)
  end
end
