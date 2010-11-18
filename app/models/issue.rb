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
  
  set_callback(:save, :before) do |document|
    document.set_priority_number
  end

  scope :by_priority, order_by("priorty_number.desc")


  def assign_to(user)
    self.update_attributes(:user => user, :status => "assigned")
  end

  protected
    def set_priority_number
      issues = Issue.by_priority
      issues.blank? ? self.priority_number = 1 : self.priority_number = (issues.last.priority_number + 1)
    end
end
