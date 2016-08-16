class CreateMenuItems < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.string :image
      t.string :description
      t.decimal :price, precision: 8, scale: 2
      t.integer :menu_category_id

      t.timestamps
    end

    add_index :menu_items, :menu_category_id
  end
end
