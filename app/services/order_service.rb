class OrderService
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :qr, :uuids, :lat, :lng, :goods, :place

  validates :qr, :uuids, :lat, :lng, :goods, presence: true

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def save
  end

  def persisted?
    false
  end
end
