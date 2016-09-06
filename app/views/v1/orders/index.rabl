collection @orders
attributes :id

node :created_at do |order|
  order.created_at_unix
end

child :order_menu_items, root: 'menu_items', object_root: false do
  glue :menu_item do
    attribute :id, :name, :price

    node :image do |item|
      item.image.url
    end
  end

  node :bonus do |item|
    item.bonus
  end
end
