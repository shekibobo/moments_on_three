# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  helper_method :authenticate_admin!
  helper_method :admin_signed_in?

  helper_method :current_order

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

  def current_order
    if user_signed_in?
      # if there is no active, open order for this user
      if current_user.orders.empty? or (!current_user.orders.empty? and current_user.orders.last.committed?)
        order = current_user.orders.build
        order.save
        order
      else
        # otherwise, grab the last one (it shouldn't be committed)
        current_user.orders.last
      end
    else
      redirect_to root_url,
        :notice => "You must be logged in to view an order."
    end
  end

end
