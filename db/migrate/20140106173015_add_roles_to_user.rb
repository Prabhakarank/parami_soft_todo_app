class AddRolesToUser < ActiveRecord::Migration
  def change
    add_column :users, :roles, :string
    add_index :users, :roles
  end
end
