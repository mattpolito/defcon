class Issue
  include Mongoid::Document
  field :title
  field :description
  field :author
  field :priority_number

end
