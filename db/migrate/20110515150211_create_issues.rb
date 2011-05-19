class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.text :description
      t.string :status, :default => 'unassigned'
      t.integer :priority_number, :default => 0

      t.timestamps
    end
  end
end
