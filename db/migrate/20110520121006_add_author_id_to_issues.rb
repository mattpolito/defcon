class AddAuthorIdToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :author_id, :integer
    add_index :issues, :author_id
  end
end
