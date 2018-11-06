class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def my_bookings
    @bookings = User.bookings(current_user)
  end

  def my_rentings
    @bookings = User.bookings()
  end

end
