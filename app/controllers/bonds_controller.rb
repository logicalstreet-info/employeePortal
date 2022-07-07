class BondsController < ApplicationController
  before_action :get_users, only: %i[new create edit update index]

  def index
    if current_user.organization.feature_flag.employee_bond == 'on'
      @bonds = Bond.all
    else
      redirect_to root_path
    end
  end
  
  def new
    @bond = Bond.new
  end

  def create
    @bond = Bond.new(bond_params.merge(organization_id: current_user.organization_id))
    respond_to do |format|
      if @bond.save
        format.html { redirect_to bonds_path, notice: 'Bond Sucessfully Created ' }
      else
        format.html { render :new, status: :unprocessable_entity}
      end
    end
  end

  def edit
    @bond = Bond.find(params[:id])
  end

  def update
    @bond = Bond.find(params[:id])
    if @bond.update(bond_params)
      redirect_to bonds_path
    else
      render :edit
    end  
  end

  def destroy
    @bond = Bond.find(params[:id])
    @bond.destroy
    redirect_to bonds_path
  end

  private
  def bond_params
    params.require(:bond).permit(:start_date, :end_date, :description, :user_id, :organization_id)
  end

  def get_users
    @users_array = User.where(organization_id: current_user.organization_id).order(name: :asc).map { |c| [c.name, c.id] }
  end
end
