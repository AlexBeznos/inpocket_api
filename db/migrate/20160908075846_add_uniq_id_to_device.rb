class AddUniqIdToDevice < ActiveRecord::Migration[5.0]
  def change
    add_column :devices, :uniq_id, :string
  end
end
