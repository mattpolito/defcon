class Account < ActiveRecord::Base
  # Associations
  has_many :account_memberships
  has_many :users, :through => :account_memberships
  has_many :issues
end
