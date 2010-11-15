require 'spec_helper'

describe Issue do
  # it {should be_embedded_in :user}

  describe "#create" do
    before do
      @issue = Issue.create(:title => "Sample Title", :description => "Short description") 
    end
  
    it "should create a new instance given valid attributes" do
      @issue.should be_valid
    end
  end 
end
