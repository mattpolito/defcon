class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :user
      t.references :issue

      t.timestamps
    end
    add_index :assignments, :user_id
    add_index :assignments, :issue_id
  end
end
