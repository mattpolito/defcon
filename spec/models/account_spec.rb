require 'spec_helper'

describe Account do
  it { should have_db_column(:subdomain).of_type(:string) }

  it { should have_many(:account_memberships) }
  it { should have_many(:users).through(:account_memberships) }
end
