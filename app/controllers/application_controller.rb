class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_current_user!

  def set_current_user!
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
      redirect_to root_path
    end
  end
end
