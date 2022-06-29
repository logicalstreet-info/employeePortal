class PropertiesController < ApplicationController
  before_action :get_users, only: %i[new create edit update index]

  def index
    @asset_types = Property.assets_types.keys.collect { |s| [s.upcase, s] }
    @properties = if params[:user_id].present? && params[:assets_type].present?
                    Property.where(user_id: params[:user_id], assets_type: params[:assets_type])
                  elsif params[:user_id].present?
                    Property.where(user_id: params[:user_id])
                  elsif params[:assets_type].present?
                    Property.where(assets_type: params[:assets_type])
                  else 
                    Property.where(organization_id: current_user.organization_id)
                  end
    @properties = @properties.page(params[:page]).per(5)
  end

  def show; end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params.merge(
      organization_id: current_user.organization_id)
    )
    respond_to do |format|
      if @property.save
        format.html { redirect_to properties_index_path, notice: 'Property was successfully created.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('property_form',
          partial: 'properties/form',
          locals: { property: @property })
        end
      end
    end
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to properties_index_path, notice: 'Property was successfully updated.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('property_form',
          partial: 'properties/form',
          locals: { property: @property })
        end
      end
    end
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to properties_index_path, notice: 'Property was successfully destroyed.'
  end

  private

  def property_params
    params.require(:property).permit(:user_id, :name, :description, :purchase_date, :warranty_month, :assets_type, :organization_id)
  end

  def get_users
    @users_array = User.where(organization_id: current_user.organization_id).order(name: :asc).map { |c| [c.name, c.id] }
  end
end
