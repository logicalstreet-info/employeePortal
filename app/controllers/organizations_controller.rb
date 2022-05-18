class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all
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
        format.html { redirect_to organizations_index_path }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('organization_form', partial: 'organizations/form',
          locals: { organization: @organization })
        end
        format.html { render :new }
      end
    end
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])

    if @organization.update(organization_params)
      redirect_to organizations_index_path, notice: 'value updated'
    else
      render :edit
    end
  end

  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy

    redirect_to organizations_index_path
  end

  private

  def organization_params
    params.require(:organization).permit(:name, weekly_off: [])
  end
end
