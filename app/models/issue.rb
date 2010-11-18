class Issue
  include Mongoid::Document
  field :title
  field :description
  field :author
  field :status, :default => "unassigned"
  field :priority_number, :type => Integer, :default => 0

  referenced_in :user

  # Validations
  validates :title, :presence => true
  validates :description, :presence => true
  validates :status, :presence => true
  validates :priority_number, :presence => true

  def assign_to(user)
    self.update_attributes(:user => user, :status => "assigned")
  end
end
