class AddPosTerminalToPlace < ActiveRecord::Migration[5.0]
  def change
    add_reference :places, :pos_terminal, polymorphic: true
    add_index :places, [:pos_terminal_id, :pos_terminal_type], unique: true
  end
end
