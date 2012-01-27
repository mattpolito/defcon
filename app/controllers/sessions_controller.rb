class SessionsController < ApplicationController
  skip_before_filter :require_login, :except => [:destroy]
  expose(:user)

  def create
    if user = login(params[:email], params[:password], params[:remember_me])
      redirect_back_or_to :root, :notice => "Login successful."
    else
      puts login(params[:email], params[:password], params[:remember_me])
      puts "*"*80
      flash[:alert] = "Login Failure. Please try again."
      redirect_to login_path
    end
  end

  def destroy
    logout
    redirect_to login_path
  end

end
