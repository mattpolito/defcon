class Issue < ActiveRecord::Base
  # Includes
  include AASM

  # Extensions
  aasm_column :status
  aasm_initial_state :unassigned
  aasm_state :unassigned

  # Validations
  validates :title, :presence => true
  validates :description, :presence => true
  validates :status, :presence => true
  validates :priority_number, :presence => true

  class << self
    def prioritize(issue_ids)
      issue_ids.each_with_index do |id, i|
        issue = Issue.find(id)
        issue.update_attributes(:priority_number => i + 1)
      end
    end
  end

  def assign_to(user_id)
    self.update_attributes(:user => User.find(user_id), :status => "assigned")
  end
end
