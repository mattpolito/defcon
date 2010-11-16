class IssuesController < ApplicationController
  
  def index
    @issues = Issue.all
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.create!(params[:issue])
    if @issue.save
      flash[:notice] = "You have successfully added a new Issue!"
      redirect_to issues_path
    else
      render :action => 'new'
    end    
  end

  def prioritize
    raise params.inspect
  end
end
