class BookingsController < ApplicationController
  before_action :set_booking

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @user = User.find(params[:user_id])
    @rocket = Rocket.find(params[:rocket_id])
    @booking = Booking.new
  end

  def create
    @user = User.find(params[:user_id])
    @rocket = Rocket.find(params[:rocket_id])
    @booking = Booking.new(booking_params)
    @booking.user = @booking
    @booking.rocket= @booking
    if @booking.save
      redirect_to user_bookings_path
    else
      render: new
    end
  end

  def destroy
    if @booking.destroy
      redirect_to user_bookings_path
    else
      render: new
    end

    private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:departure_date, :rocket_id, :user_id)
    end

  end
