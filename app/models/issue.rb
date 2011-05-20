class Issue < ActiveRecord::Base
  # Includes
  include AASM

  # Extensions
  aasm_column :status
  aasm_initial_state :unassigned
  aasm_state :unassigned
  aasm_state :assigned

  aasm_event :assign do
    transitions :from => :unassigned, :to => :assigned
  end

  # Associations
  has_many :assignments

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
    transaction do
      self.assignments.create(:user_id => user_id)
      self.assign!
    end
  end

  def currently_assigned_to
    @current_assignee ||= most_recent_assignment.user
  end

  def most_recent_assignment
    assignments.order("created_at DESC").first
  end
end
