class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login

  private
  
  def not_authenticated
    redirect_to root_path, :alert => "Please login."    
  end
end
