class VansController < ApplicationController

  def index
    if params[:query].present?
      @vans = Van.search_by_address(params[:query])
    else
      @vans = Van.all
    end
    @markers = @vans.geocoded.map do |van|
      {
        lat: van.latitude,
        lng: van.longitude,
        info_window: render_to_string(partial: "info_window", locals: { van: van })
      }
    end
  end

  def show
    @van = Van.find(params[:id])
  end

  def new
    @van = Van.new
  end

  def create
    @van = Van.new(van_params)
    @van.user = current_user
    if @van.save
      redirect_to van_path(@van)
    else
      render :new
    end
  end

  def edit
    @van = Van.find(params[:id])
  end

  def update
    @van = Van.find(params[:id])
    @van.update(van_params)

    redirect_to van_path(@van)
  end

  def destroy
    @van = Van.find(params[:id])
    @van.user = current_user
    @van.destroy

    redirect_to vans_path
  end

  private

  def van_params
    params.require(:van).permit(:size, :model, :brand, :year, :price, :description, :photo)
  end

end
