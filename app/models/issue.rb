class Issue
  include Mongoid::Document
  field :title
  field :description
  field :author
  field :priority_number

  embedded_in :user, :inverse_of => :issues
end
