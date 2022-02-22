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
  end

  def update
  end

  def destroy
  end

  private

  def van_params
    params.require(:vans).permit(:size,:model, :brand, :year, :price, :description)
  end

end
