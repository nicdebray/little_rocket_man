class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @rocket = Rocket.find(params[:rocket_id])
    @booking = Booking.new
  end

  def create
    @rocket = Rocket.find(params[:rocket_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.rocket = @rocket
    if @booking.save
      redirect_to rocket_bookings_path
    else
      render :new
    end
  end

  def destroy
    if @booking.destroy
      redirect_to rocket_bookings_path
    else
      render :new
    end
  end

  private
  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:departure_date, :rocket_id, :user_id)
  end

end
