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
  
  set_callback(:create, :before) do |document|
    document.set_priority_number
  end

  # scope :by_priority, order_by(:priority_number.asc)

  class << self
    def prioritize(issue_ids)
      priority_number = 1
      issue_ids.each do |id|
        issue = Issue.find(id)
        issue.update_attributes(:priority_number => priority_number)
        priority_number = priority_number + 1
      end
    end
  end

  def assign_to(user)
    self.update_attributes(:user => user, :status => "assigned")
  end

  protected
    def set_priority_number
      issues = Issue.order_by(:priority_number.asc)
      unless issues.blank?  
        self.priority_number = (issues.reverse.first.priority_number + 1)
      else
        self.priority_number = 1       
      end
    end
end
