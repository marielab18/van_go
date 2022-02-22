class VansController < ApplicationController

  def index
    @vans = Van.all
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
    params.require(:van).permit(:size, :model, :brand, :year, :price, :description)
  end

end
