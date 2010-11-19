require 'spec_helper'

describe Issue do

  it { should be_referenced_in(:user).as_inverse_of(:issues) }

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

    # Cannot find elegant solution to test priority number setting correctly in accending order.  
    # it 'sets the priority number as the next highest in the list' do
      # subject.priority_number.should == 1
      # Issue.create(valid_attributes).priority_number.should == 1
      # Issue.create(valid_attributes).priority_number.should == 2
    # end
  end

  describe 'instantiating a new object with no attributes' do
    subject { Issue.new }

    it { should have(1).error_on(:title) }
    it { should have(1).error_on(:description) }

    it "has a default status of 'unassigned'" do
      subject.status.should == "unassigned" 
    end

    it "has a default priority of '0'" do
      subject.priority_number.should == 0
    end
  end

  describe '#assign_to(user)' do
    subject { Issue.new(valid_attributes) }

    it 'should change status to assigned' do
      subject.assign_to(Fabricate(:user).id)
      subject.status.should == "assigned"
    end

    it 'should reference the user is has been assigned to' do
      @user = Fabricate(:user)
      subject.assign_to(@user.id)
      subject.user.should == @user
    end
  end

  describe '#prioritize' do
    let(:issues) {
      [
        Issue.create(valid_attributes),
        Issue.create(valid_attributes),
        Issue.create(valid_attributes)
        # mock_model(Issue, priority_number => 1),
        # mock_model(Issue, priority_number => 2),
        # mock_model(Issue, priority_number => 3)
      ]
    }
    
    let(:issue_ids) { issues.collect(&:id) }
    
    it 're-prioritizes collection of issues based on the order given' do
      issue = issues.first
      reversed_ids = issue_ids.reverse
      Issue.prioritize(reversed_ids)
      issue.reload.priority_number.should == 3
    end
  end
end
