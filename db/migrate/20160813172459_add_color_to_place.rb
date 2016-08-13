class AddColorToPlace < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :color, :string
  end
end
