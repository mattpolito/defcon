require 'spec_helper'

describe Issue do

  it { should have_db_column(:title).of_type(:string) }
  it { should have_db_column(:description).of_type(:text) }
  it { should have_db_column(:status).of_type(:string).
    with_options(:default => 'unassigned') }
  it { should have_db_column(:priority_number).of_type(:integer) }
  
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
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

    it "has a default status of 'unassigned'" do
      subject.status.should == "unassigned" 
    end

    it "has a default priority of '0'" do
      subject.priority_number.should == 0
    end
  end

  describe '#assign_to(user)' do
    subject { Issue.create(valid_attributes) }

    it 'should change status to assigned' do
      subject.assign_to(23)
      subject.should be_assigned
    end
  end

  describe "#currently_assigned_to" do
    subject { Issue.create(valid_attributes) }
    let(:user) { mock_model(User, :id => 42) }

    before do
      subject.stub(:most_recent_assignment).
        and_return(mock_model(Assignment, :user => user))
      User.stub(:find).and_return(user)
    end

    it 'returns user with most recent assignment' do
      subject.assign_to(user.id)
      subject.currently_assigned_to.should == user
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
