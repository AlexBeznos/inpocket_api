class OrderService
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :qr, :uuids, :lat, :lng, :goods, :place, :user,
                :present_ids, :menu_item_ids, :decorated_menu_items

  validates :qr, :uuids, :lat, :lng, :goods, presence: true

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end

    init_goods
    init_decorated_items
  end

  def save
    order = save_order
    save_presents_for order
    save_menu_items_for order
  end

  def persisted?
    false
  end

  private

  def save_order
    Order.create!(place: place, user: user)
  end

  def save_presents_for(order)
    present_ids.each do |present|
      OrderPresent.create!(order: order, present_id: present)
    end
  end

  def save_menu_items_for(order)
    decorated_menu_items.each do |menu_item|
      OrderMenuItem.create!(
        order: order,
        menu_item: menu_item,
        bonus: menu_item.bonus
      )
    end
  end

  def init_goods
    ['present', 'menu_item'].each do |good_type|
      selected = goods.select { |good| good[:type] == good_type }
                      .map { |good| good[:id] }

      instance_variable_set("@#{good_type}_ids", selected)
    end
  end

  def init_decorated_items
    self.decorated_menu_items = MenuItem.includes(menu_category: :place)
                                        .where(id: menu_item_ids)
                                        .decorate
  end
end
