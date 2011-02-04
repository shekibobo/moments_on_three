# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  helper_method :authenticate_admin!
  helper_method :admin_signed_in?

  private
  def authenticate_admin!
    if admin_signed_in?
      return true
    end
    redirect_to root_url,
      :notice => "You must be logged in as an administrator."
    return false
  end

  def admin_signed_in?
    user_signed_in? && current_user.admin?
  end

end
