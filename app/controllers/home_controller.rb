class HomeController < ApplicationController
  def index
    @users = User.where(
      :organization_id => current_user.organization_id)
    @bday = @users.where("(DATE_PART('month', birth_date) = ? AND DATE_PART('day', birth_date) >= ?) OR (DATE_PART('month', birth_date) = ? AND DATE_PART('day', birth_date) <= ?)", Date.current.month, Date.current.day, Date.current.month + 1 ,
    Date.current.day)
  end
end