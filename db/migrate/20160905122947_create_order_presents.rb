class CreateOrderPresents < ActiveRecord::Migration[5.0]
  def change
    create_table :order_presents do |t|
      t.integer :order_id
      t.integer :present_id

      t.timestamps
    end

    add_index :order_presents, :order_id
    add_index :order_presents, :present_id
  end
end
