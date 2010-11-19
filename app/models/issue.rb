class Issue
  include Mongoid::Document
  field :title
  field :description
  field :author
  field :status, :default => "unassigned"
  field :priority_number, :type => Integer, :default => 0

  referenced_in :user, :inverse_of => :issues

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
