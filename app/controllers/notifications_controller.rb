class NotificationsController < ApplicationController
  before_action :find_notification, except: %i[index new create]
  before_action :find_users, only: %i[new create edit update]

  def index
    @notifications = Notification.all
  end

  def new
    @notification = Notification.new
  end

  def show; end

  def create
    @notification = Notification.create(notification_params.merge(organization_id: current_user.organization_id))

    respond_to do |format|
      if @notification.save!
        format.html { redirect_to notifications_path }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('notification_form', partial: 'notifications/form',
          locals: { notification: @notification })
        end
        format.html { render :new }
      end
    end
  end

  def update
    @notification = Notification.find(params[:id])

    if @notification.update(notification_params)
      redirect_to notifications_path, notice: 'value updated'
    else
      render :edit
    end
  end

  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_path, notice: 'Notification was successfully destroyed.' }
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:title, :description, :organization_id, user_id: [])
  end

  def find_notification
    @notification = Notification.find(params[:id])
  end

  def find_users
    @users = if current_user.organization
               current_user.organization.users.map { |u| [u.name, u.id] }
             else
               []
             end
  end
end
