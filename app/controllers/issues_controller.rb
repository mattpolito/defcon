class IssuesController < ApplicationController
  
  def index
    @issues = Issue.order_by(:priority_number.asc)
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(params[:issue])
    if @issue.save
      flash[:success] = "You have successfully added a new Issue!"
      redirect_to issues_path
    else
      render :action => 'new'
    end    
  end

  def prioritize
    Issue.prioritize(params["issue_ids"])
    redirect_to "index"
  end
end
