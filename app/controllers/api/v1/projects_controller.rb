class Api::V1::ProjectsController < ApplicationController
  def index
    @users = User.where('organization_id = ? AND name ILIKE?',current_user.organization_id,  "%#{params[:name]}%")
    render json: {data: @users}
  end
end