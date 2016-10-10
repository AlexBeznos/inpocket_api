class AddReferalNumberToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :referal_number, :string
    add_index :users, :referal_number
  end
end
