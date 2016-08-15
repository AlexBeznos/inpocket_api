class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_categories do |t|
      t.integer :place_id
      t.string :name

      t.timestamps
    end
  end
end
