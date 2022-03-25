class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end
  
  def show
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    respond_to do |format|
      if @property.save
        format.html { redirect_to properties_index_path }

      else
        format.html { render :new }
      end
    end
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])

    if @property.update(property_params)
      redirect_to properties_index_path, notice: "value updated"
    else
      render :edit
    end
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy

    redirect_to properties_index_path
  end

  private

  def property_params
    params.require(:property).permit(:name, :description)
  end
end
