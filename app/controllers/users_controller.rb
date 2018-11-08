class UsersController < ApplicationController
  skip_after_action :verify_authorized, only: [:show, :my_bookings, :my_rentings]

  def show
  end

  def my_bookings
    @bookings = User.bookings(current_user)
  end

  def my_rentings
    @bookings = User.rockets(current_user)
  end

end
