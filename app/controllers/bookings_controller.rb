class BookingsController < ApplicationController
  before_action :set_van, only: [:new, :create]
  before_action :set_user, only: [:create, :index]

  def index
    @bookings = Booking.all.where(user: @user)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.van = @van
    if @booking.save!
      redirect_to bookings_path
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to bookings_path(@booking.user)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path(@booking.user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :finish_date)
  end

  def set_van
    @van = Van.find(params[:van_id])
  end

  def set_user
    @user = current_user
  end
end
