require 'spec_helper'

describe User do
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }

  it { should have_many(:authentications) }
end
