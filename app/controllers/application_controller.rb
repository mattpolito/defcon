class ApplicationController < ActionController::Base
  include UrlHelper

  protect_from_forgery

  # before_filter :authenticate
  helper_method :current_user

  private
    def authenticate
      redirect_to signin_path unless current_user
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end
