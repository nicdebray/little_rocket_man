class RentersController < ApplicationController

  def new
    @renter = Renter.new
    @user = User.find(params[:user_id])
  end

  def create
    @renter = Renter.new(renter_params)
    @renter.user = current_user
    if @renter.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def show
  end

  def edit
    @renter = current_user.renter
  end

  def update
    @renter = current_user.renter
    if @renter.update(renter_params)
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def renter_params
    params.require(:renter).permit(:first_name, :last_name, :country, :user_id)
  end
end
