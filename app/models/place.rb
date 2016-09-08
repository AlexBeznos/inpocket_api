class Place < ApplicationRecord
  include Colorable
  include Paginatable
  include Filterable

  colorate :color
  serialize :phones, Array
  serialize :working_hours, Hash

  mount_base64_uploader :logo, BaseUploader
  mount_base64_uploader :card_image, BaseUploader

  has_many :beacons, dependent: :destroy
  has_many :presents, dependent: :destroy
  has_many :shares, dependent: :destroy
  has_many :menu_categories, dependent: :destroy
  has_many :photos, class_name: PlaceImage, dependent: :destroy

  scope :by_uuid, -> (uuid) { joins(:beacons).where("beacons.uuid in (?)", uuid) }

  geocoded_by :address, latitude: :lat, longitude: :lng

  validates :name, :description, :logo, :address, :working_hours, :site, :category, presence: true
  validates :color, inclusion: { in: Colorable::COLORS.keys }
  validates :bonus_part, inclusion: { in: 1..100 }

  def present_received?(user)
    DebutPresentRelation.exists?(place_id: id, user_id: user.id)
  end
end
