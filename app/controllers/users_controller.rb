class UsersController < ApplicationController
  before_action :find_user
  def index
  end

  def show
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    respond_to do |format|
      if @user.update!(user_params)
      
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def find_user
    @user = current_user
  end
  def user_params
    params.require(:user).permit(:name, :joining_date, :birth_date, :gender, :qualification, :mobile_number, :address,
    :native_address, :address, :parent_mobile_number, :user_type, :email, :password, :password_confirmation  )
  end
end
