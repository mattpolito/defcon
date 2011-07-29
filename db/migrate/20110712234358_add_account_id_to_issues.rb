class AddAccountIdToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :account_id, :integer
  end
end
