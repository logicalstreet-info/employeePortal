class UsersController < ApplicationController
  before_action :find_user
  def index
    @users = User.where(organization_id: current_user.organization_id).page(params[:page]).per(5)
  end

  def show   
    @user = User.find(params[:id])
    @users = User.all_except(current_user)

    @group = Group.new
    @groups = Group.public_groups.where(organization_id: current_user.organization_id)
    @group_name = get_name(@user, current_user)

    @single_group = Group.where(
      name: @group_name).first || Group.create_private_group(
        [@user, current_user], @group_name, current_user.organization_id)

    @message = Message.new
    @messages = @single_group.messages.order(created_at: :asc)

    render 'groups/index'
  end

  def new; end

  def edit
    @user = User.find(params[:id])
  end

  def update
    respond_to do |format|
      if @user.update!(user_params)
        format.html { redirect_to user_url(@user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_index_path
  end

  def user_profile
    @user = User.find(params[:id])
    @leaves = LeaveApplication.where(user_id: current_user).order('created_at DESC')
    @properties = Property.where(user_id: current_user.id)
  end

  private

  def find_user
    @user = current_user
  end

  def get_name(user1, user2)
    user = [user1, user2].sort
    "private_#{user[0].id}_#{user[1].id}"
  end

  def user_params
    params.require(:user).permit(:name, :joining_date, :birth_date, :gender, :qualification, :mobile_number, :address,
    :native_address, :address, :parent_mobile_number, :user_type, :email, :password, :password_confirmation,
    :organization_id)
  end
end
