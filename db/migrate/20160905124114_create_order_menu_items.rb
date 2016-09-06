class CreateOrderMenuItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_menu_items do |t|
      t.integer :order_id
      t.integer :menu_item_id
      t.integer :bonus

      t.timestamps
    end

    add_index :order_menu_items, :order_id
    add_index :order_menu_items, :menu_item_id
  end
end
