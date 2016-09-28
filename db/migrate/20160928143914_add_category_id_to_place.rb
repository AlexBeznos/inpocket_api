class AddCategoryIdToPlace < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :category_record_id, :integer
    add_index :places, :category_record_id
  end
end
