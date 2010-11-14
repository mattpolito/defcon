class IssuesController < ApplicationController
  

  def index
    @issues = current_user.issues
  end

  def new
    @issue = current_user.issues.new
  end

  def create
    @issue = current_user.issues.create!(params[:issue])
    if @issue.save
      flash[:notice] = "You have successfully added a new Issue!"
      redirect_to issues_path
    else
      render :action => 'new'
    end    
  end
end
