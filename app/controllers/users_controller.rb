class UsersController < ApplicationController
  skip_after_action :verify_authorized, only: [:show]

  def show
   @rentings = Booking.rentings_for(current_user)
  end

end
