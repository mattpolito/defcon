require 'spec_helper'

describe Issue do
  it { should have_field(:title).of_type(String) }
  it { should have_field(:description).of_type(String) }

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
  end

  describe 'instantiating a new object with no attributes' do
    subject { Issue.new }

    it { should have(1).error_on(:title) }
    it { should have(1).error_on(:description) }
  end
end
