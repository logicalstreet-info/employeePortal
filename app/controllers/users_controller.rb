class UsersController < ApplicationController
  before_action :find_user, only: %i[edit update destroy]

  def index
    @users = User.all_except(current_user).where(organization_id: current_user.organization_id).order(name: "ASC").page(params[:page]).per(5)
  end
   
  def switch_and_redirect_view
    if cookies[:is_admin_view].present?
      cookies.delete :is_admin_view
      cookies[:is_user_view] = true
    elsif cookies[:is_user_view].present?
      cookies.delete :is_user_view
      cookies[:is_admin_view] = true
    else
      cookies[:is_user_view] = true
    end
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
    @users = User.all_except(current_user).where(organization_id: current_user.organization_id)

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

  def new
    @user = User.new
  end

  def add_user
    @user = User.new(user_params.except(:skills))  
    
    if @user.organization_id
      @user.add_role :admin
      @user.remove_role :newuser
    else
      @user.organization_id = current_user.organization_id
      create_or_delete_users_skills(@user, params[:user][:skills])
    end

    respond_to do |format|
      if @user.save
        format.html { redirect_to params[:redirect_url], notice: 'User was successfully created.' }
      else
        format.turbo_stream do
          if  params[:redirect_url] == "/users"
            render turbo_stream: turbo_stream.replace('user_form',
            partial: 'users/form',
            locals: { user: @user })
          else
            render turbo_stream: turbo_stream.replace('super_admin_form',
            partial: 'users/super_admin_form',
            locals: { user: @user })
          end
        end
        format.html { render :new, status: :unprocessable_entity}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('user_form',
          partial: 'users/form',
          locals: { user: @user })
        end
        format.html { render :edit, status: :unprocessable_entity}
      end
    end
  end

  def edit_user
    @user = User.find(params[:id])
  end

  def update_user
    @user = User.find(params[:id])
    create_or_delete_users_skills(@user, params[:user][:skills])

    respond_to do |format|
      if @user.update(user_params.except(:skills))
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('edit_user_form',
          template: 'users/edit_user',
          locals: { user: @user })
        end
        format.html { render :edit_user, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_index_path, notice: 'User was successfully destroyed.'
  end

  def user_profile
    @user = User.find(params[:id])
    @leaves = LeaveApplication.where(user_id: current_user).order('created_at DESC')
    @properties = Property.where(user_id: current_user.id)
  end

  def assign_admin_role
    @user = User.find(params[:id])
    @user.add_role :admin
    redirect_to users_index_path, notice: "Successfully Assign Admin Role To '#{@user.name}'!"
  end

  def remove_admin_role
    @user = User.find(params[:id])
    @user.remove_role :admin
    redirect_to users_index_path, notice: "Successfully Remove Admin Role To '#{@user.name}'!"
  end

  private

  def create_or_delete_users_skills(user, skills)
    user.taggables.destroy_all
    skills = skills.strip.split(',')
    skills.each do |skill|
      user.skills << Skill.find_or_create_by(name: skill)
    end
  end

  def find_user
    @user = current_user
  end

  def get_name(user1, user2)
    user = [user1, user2].sort
    "private_#{user[0].id}_#{user[1].id}"
  end

  private
  def user_params
    params.require(:user).permit(:name, :joining_date, :birth_date, :gender, :qualification, :mobile_number,
    :native_address, :address, :parent_mobile_number, :user_type, :email, :password, :password_confirmation,
    :organization_id, :employee_positions, :skills)
  end
end
