class OrderService
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :qr, :uuids, :lat, :lng, :goods, :place, :user,
                :present_ids, :menu_item_ids, :decorated_menu_items,
                :decorated_presents

  validates :qr, :uuids, :lat, :lng, :goods, presence: true

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end

    init_goods
    init_decorate_items
    init_decorate_presents
  end

  def save
    order = save_order
    save_presents_for order
    decrease_bonuses if decorated_presents.any?
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

  def decrease_bonuses
    number_of_bonuses = decorated_presents.map(&:price).inject(0, &:+)
    score             = place.user_scores.find_by(user: user)
    score.update(bonus: score.bonus - number_of_bonuses)
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

  def init_decorate_items
    items = MenuItem.includes(menu_category: :place).where(id: menu_item_ids)
    items_array = menu_item_ids.map {|id| items.find {|item| item.id == id}}
    self.decorated_menu_items = MenuItemDecorator.decorate_collection(items_array)
  end

  def init_decorate_presents
    presents = Present.where(id: present_ids)
    presents_arr = present_ids.map {|id| presents.find {|item| item.id == id}}
    self.decorated_presents = presents_arr
  end
end
