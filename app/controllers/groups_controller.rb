class GroupsController < ApplicationController
  def index
    @group = Group.new
    @groups = Group.public_groups.where(:organization_id => current_user.organization_id)
    @users = User.all_except(current_user)

    render 'index'
  end

  def show
    @group = Group.new
    @groups = Group.public_groups.where(:organization_id => current_user.organization_id)

    @single_group = Group.find(params[:id])

    @message = Message.new
    @messages = @single_group.messages.order(created_at: :asc)

    @users = User.all_except(current_user)

    render 'index'
  end

  def new
    @group = Group.new
  end
  
  def create
    @group = Group.create!(group_params.merge(
      organization_id: current_user.organization_id ))
    if @group.save
      flash[:success] = "Group #{@group.name} was created successfully"
      redirect_to groups_path
    else
      render :new
    end
  end

  def group_params
    params.require(:group).permit(:name, :organization_id)
  end
end