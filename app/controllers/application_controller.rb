class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login

  private
  
  def not_authenticated
    flash[:alert] = "Not authorized to view this page, please login."
    redirect_to login_path
  end
end
