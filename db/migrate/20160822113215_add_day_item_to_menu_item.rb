class AddDayItemToMenuItem < ActiveRecord::Migration[5.0]
  def change
    add_column :menu_items, :day_item, :boolean, default: false
  end
end
