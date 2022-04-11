class UpdatesController < ApplicationController
  before_action :find_user

  def index
    if current_user.has_role? :admin
      @updates = Update.all.order("created_at DESC")
      respond_to do |format|
        format.html
        format.csv { send_data @updates.to_csv}
      end
    else
      @updates = Update.where(:user_id => current_user).order("created_at DESC")
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
        format.html { redirect_to updates_path, notice: "Update was successfully created." }
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
        format.html { redirect_to updates_url, notice: "Your Daily was successfully updated." }
        format.json { render :show, status: :ok, location: @update }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('update_form',
            partial: 'updates/form',
            locals: { update: @update })
        end
      end
    end 
  end

  def import
    Update.import(params[:file])
    redirect_to updates_path, notice: "successfully updated"
  end

  private
  def update_params
    params.require(:update).permit(:description, :in_time, :out_time, :project_id )
  end

  def find_user
    @user = current_user
  end
end
