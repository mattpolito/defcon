class IssuesController < ApplicationController
  respond_to :html, :json

  expose(:issues) { Issue.order("priority_number ASC") }
  expose(:issue)

  def create
    issue.author = current_user
    if issue.save
      flash[:success] = "You have successfully added a new Issue!"
      redirect_to issues_path
    else
      render :action => 'new'
    end
  end

  def prioritize
    raise "HERE"
    Issue.prioritize(params["issue_ids"])
    redirect_to :index
  end

  def assignment
    issue.assign_to(params["assigned_user"])
    redirect_to :index
  end
end
