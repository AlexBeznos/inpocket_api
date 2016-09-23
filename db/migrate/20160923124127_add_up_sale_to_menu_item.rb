class AddUpSaleToMenuItem < ActiveRecord::Migration[5.0]
  def change
    add_column :menu_items, :up_sale, :boolean, default: false
  end
end
