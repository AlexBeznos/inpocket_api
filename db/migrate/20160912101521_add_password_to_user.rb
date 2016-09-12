class AddPasswordToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :email, :string
    add_column :users, :password_digest, :string, default: ''

    add_index :users, :email
  end
end
