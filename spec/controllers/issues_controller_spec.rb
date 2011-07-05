require 'spec_helper'

describe IssuesController do
  let(:user) { mock_model(User) }
  let(:issue) { mock_model(Issue) }

  describe "when authenticated" do
    before do
      controller.stub(:current_user).and_return(user)
    end

    describe "GET index" do
      it "succeeds" do
        get :index
        response.should be_success
      end

      it "assigns all issues to variable for the view" do
        Issue.should_receive(:order).and_return([issue])
        get :index
        controller.issues.should == [issue]
      end

      it "renders index template" do
        get :index
        response.should render_template(:index)
      end
    end
    
    describe "GET new" do
      it "succeeds" do
        get :new
        response.should be_success
      end

      it "assigns a new issue for the view" do
        Issue.stub(:new).and_return(issue)
        get :new
        controller.issue.should be(issue)
      end

      # it "renders the new template" do
      #   get :new
      #   response.should render_tempate(:new)
      # end
    end

    describe "POST create" do
      before do
        user.stub(:email)
        issue.stub(:author=)
      end

      it "assigns a newly instantiated issue to variable for the view" do
        Issue.stub(:new).and_return(issue)
        issue.stub(:save).and_return(true)
        post :create
        controller.issue.should be(issue)
      end

      describe "with valid params" do
        def post_with_valid_attributes
          Issue.stub(:new).and_return(issue)
          issue.stub(:save).and_return(true)
          post :create, :issue => {}
        end

        before do
          post_with_valid_attributes
        end

        it "sets flash message to be displayed" do
          flash[:success].should_not be_blank
        end

        it "redirects to issues" do
          response.should redirect_to(issues_path)
        end
      end

      describe "with invalid params" do
        def post_with_invalid_params
          Issue.stub(:new).and_return(issue)
          issue.stub(:save).and_return(false)
          post :create, :issue => {}
        end

        before do 
          post_with_invalid_params
        end

        it "assigns a new unsaved issue to variable for the view" do
          controller.issue.should be(issue)
        end

        it "re-renders the 'new' template" do
          response.should render_template(:new)
        end
      end
    end
  end

  describe "unauthenticated users get redirected when" do
    before do
      controller.stub(:current_user).and_return(nil)
    end
    it "GET index" do
      get :index
      response.should be_redirect
    end

    it "GET new" do
      get :new
      response.should be_redirect
    end

    it "POST create" do
      post :create
      response.should be_redirect
    end
  end

end
