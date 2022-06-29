class UpdatesController < ApplicationController
  before_action :find_user
  before_action :get_users, only: %i[index]

  def index
    if has_role_admin?
      @updates = Update.joins(:user).where(users: { organization_id: current_user.organization_id }).order(
        'updates.created_at DESC')
      if params[:type] == 'day'
        @updates = Update.where('DATE(created_at) = ? ', Date.yesterday)
      elsif params[:type] == 'month'
        @updates = Update.where("DATE_PART('month', created_at) = ? OR  DATE_PART('year', created_at) = ? ",
          Date.current.month, Date.current.year)
      end
    else
      @updates = Update.where(user_id: current_user).order('created_at DESC')
    end
    @daily_updates = if params[:user_id].present?
                      @updates.where(user_id: params[:user_id])
                     elsif params[:date].present?
                      @updates.where("DATE(in_time) = ?", params[:date].to_date)
                     else
                      @updates.all
                     end
    @daily_updates = @daily_updates.page(params[:page]).per(5)
    respond_to do |format|
      format.html
      format.csv { send_data @updates.to_csv }
    end
  end

  def new
    @update = Update.new
  end

  def create
    @update = Update.new(update_params)
    @update.user_id = current_user.id

    respond_to do |format|
      if @update.save
        format.html { redirect_to updates_path, notice: 'Update was successfully created.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('update_form',
          partial: 'updates/form',
          locals: { update: @update })
        end
      end
    end
  end

  def edit
    @update = Update.find(params[:id])
  end

  def update
    @update = Update.find(params[:id])
    @update.user_id = current_user.id
    respond_to do |format|
      if @update.update(update_params)
        format.html { redirect_to updates_url, notice: 'Your Daily update was successfully updated.' }
        format.json { render :show, status: :ok, location: @update }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('update_form', partial: 'updates/form',
            locals: { update: @update })
        end
      end
    end
  end

  def import
    Update.import(params[:file])
    redirect_to updates_path, notice: 'successfully updated'
  end

  private

  def update_params
    params.require(:update).permit(:description, :in_time, :out_time, :project_id)
  end

  def find_user
    @user = current_user
    @project = current_user.projects
  end

  def get_users
    @users_array = User.where(organization_id: current_user.organization_id).order(name: :asc).map { |c| [c.name, c.id] }
  end
end
