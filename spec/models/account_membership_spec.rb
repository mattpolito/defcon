require 'spec_helper'

describe AccountMembership do
  it { should have_db_column(:account_id).of_type(:integer) }
  it { should have_db_column(:user_id).of_type(:integer) }

  it { should belong_to(:account) }
  it { should belong_to(:user) }
end
