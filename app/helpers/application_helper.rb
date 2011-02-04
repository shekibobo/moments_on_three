module ApplicationHelper
  def authenticate_admin!
    if current_user.admin?
      return true
    end
    redirect_to root_url,
      :notice => "You must be logged in as an administrator."
    return false
  end
end
