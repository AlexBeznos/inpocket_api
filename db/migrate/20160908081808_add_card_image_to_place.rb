class AddCardImageToPlace < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :card_image, :string
  end
end
