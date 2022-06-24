class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_current_user!
  helper_method :has_role_admin?
  helper_method :has_role_newuser?

  def set_current_user!
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
      redirect_to root_path
    end
  end

  def has_role_admin?
    is_admin_view = true
    if current_user.has_all_roles? :admin, :newuser
      is_admin_view = cookies[:is_admin_view].present?
    end
    current_user.has_role_admin && is_admin_view
  end

  def has_role_newuser?
    is_user_view = true
    if current_user.has_all_roles? :admin, :newuser
      is_user_view = cookies[:is_user_view].present?
    end
    current_user.has_role_newuser && is_user_view
  end
end
