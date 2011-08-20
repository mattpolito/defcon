class ProtectedBaseController < ApplicationController

  def current_account
    @current_account ||= current_user.accounts.find_by_subdomain(request.subdomain)
  end
end
