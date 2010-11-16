require 'spec_helper'

describe Issue do
  it { should have_field(:title).of_type(String) }
  it { should have_field(:description).of_type(String) }
  it { should have_field(:author).of_type(String) }
  it { should have_field(:status).of_type(String) }
  it { should have_field(:priority_number).of_type(Integer) }
  
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:priority_number) }

  let(:valid_attributes) do
    {
      :title => 'title',
      :description => 'description'
    }
  end

  describe 'instantiating a new object with valid attributes' do
    subject { Issue.new(valid_attributes) }

    it 'creates a new instance' do
      subject.should be_valid
    end

    it 'updates status to unassigned by default' do
      subject.status.should == "unassigned"
    end
  end

  describe 'instantiating a new object with no attributes' do
    subject { Issue.new }

    it { should have(1).error_on(:title) }
    it { should have(1).error_on(:description) }

    it "has a default status of 'unassigned'" do
      subject.status.should == 'unassigned' 
    end

    it "has a default priority of '0'" do
      subject.priority_number.should == 0
    end
  end
end
