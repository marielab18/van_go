class BookingsController < ApplicationController
  before_action :set_van, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.van = @van
    @booking.user = current_user
    if @booking.save!
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :finish_date)
  end

  def set_van
    @van = Van.find(params[:van_id])
  end
end
