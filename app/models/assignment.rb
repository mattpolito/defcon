class Assignment < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :issue
end
