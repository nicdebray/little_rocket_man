class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def my_bookings
    @bookings = User.bookings(current_user)
  end

  def my_rentings
  end

end
