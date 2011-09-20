class ChangeLoginIdentifier < ActiveRecord::Migration
  def up
    remove_column :users, :username
    change_column :users, :email, :string, :null => false
  end

  def down
    change_column :users, :email, :string, :null => true
    add_column :users, :username, :string, :null => false
  end
end
