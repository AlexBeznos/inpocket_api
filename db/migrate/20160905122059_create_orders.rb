class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :place_id
      t.integer :user_id

      t.timestamps
    end

    add_index :orders, :place_id
    add_index :orders, :user_id
  end
end
