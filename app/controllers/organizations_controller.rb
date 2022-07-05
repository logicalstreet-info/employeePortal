class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.page(params[:page]).per(5)
  end

  def admin_index
    @organizations = current_user.organization
  end

  def super_fetaure_edit
    @organization = Organization.find(params[:id])
    @feature_flag = FeatureFlag.find_or_create_by(organization_id: @organization.id)
  end

  def super_fetaure_update
    @organization = Organization.find(params[:id])
    if @organization.update!(organization_params)
      redirect_to organizations_index_path, notice: 'Organization was successfully updated'
    else
      render :super_fetaure_edit
    end
  end
  
  def show
    @organization = Organization.find(params[:id])
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    respond_to do |format|
      if @organization.save
        format.html { redirect_to organizations_index_path,  notice: 'Organization was successfully created.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('organization_form',
          partial: 'organizations/form',
          locals: { organization: @organization })
        end
      end
    end
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to organizations_index_path,  notice: 'Organization was successfully updated.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('organization_form',
          partial: 'organizations/form',
          locals: { organization: @organization })
        end
      end
    end
  end

  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy

    redirect_to organizations_index_path, notice: 'Organization was successfully destroyed.'
  end

  private

  def organization_params
    params.require(:organization).permit(:name, weekly_off: [], feature_flag_attributes: [:id, :employee_bond, :organization_id] )
  end
end
