require 'spec_helper'

describe Authentication do
  it { should have_db_column(:provider).of_type(:string) }
  it { should have_db_column(:uid).of_type(:string) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }
  it { should belong_to(:user) }
end
