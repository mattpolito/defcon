class CreateAccountMemberships < ActiveRecord::Migration
  def change
    create_table :account_memberships do |t|
      t.references :account
      t.references :user

      t.timestamps
    end
    add_index :account_memberships, :account_id
    add_index :account_memberships, :user_id
  end
end
