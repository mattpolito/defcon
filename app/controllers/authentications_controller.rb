class AuthenticationsController < ApplicationController
  def index
    
  end

  def create
    auth = request.env["rack.auth"]
    current_user.authentications.create(
      :provider => auth["provider"], :uid => auth["uid"]
    )
    flash[:notice] = "Authentication successful."
    redirect_to authentications_url
  end

  def destroy
    
  end
end
