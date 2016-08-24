class AddBonusPercentToPlace < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :bonus_part, :integer, default: 10
  end
end
