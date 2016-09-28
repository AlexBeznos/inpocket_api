class CreatePosTerminalPosters < ActiveRecord::Migration[5.0]
  def change
    create_table :pos_terminal_posters do |t|
      t.string :account
      t.string :access_token
      t.integer :waiter_id

      t.timestamps
    end
  end
end
