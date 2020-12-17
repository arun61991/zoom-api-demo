class AddFirstNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :user_type, :string
    add_column :users, :zoom_user_id, :string
  end
end
