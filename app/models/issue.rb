class Issue
  include Mongoid::Document
  field :title
  field :description
  field :author
  field :priority_number

  validates :title, :presence => true
  validates :description, :presence => true
end
