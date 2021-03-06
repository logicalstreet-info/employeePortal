class PasswordsController < ApplicationController
  respond_to :html, :json
  before_action :find_user, only: %i[edit update]

  def edit
  end
  
  def update
    respond_to do |format|
      if @user.update(password_params)
        format.html { redirect_to root_path, notice: 'Your Password Is Successfully Updated!' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('password_form',
          partial: 'passwords/form',
          locals: { user: @user })
        end
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def edit_password
    @user = User.find(params[:id])
  end

  def update_password
    respond_to do |format|
      @user = User.find(params[:id])
      if @user.update(password_params)
        format.html { redirect_to users_path, notice: 'Your User Password Is Successfully Updated!' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('edit_user_password_form', partial: 'passwords/admin_form',
          locals: { password: @password })
        end
        format.html { render :edit_password, status: :unprocessable_entity }
      end
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def find_user
    @user = current_user
  end
end
