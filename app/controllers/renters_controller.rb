class RentersController < ApplicationController
  before_action :set_renter

  def new
    @renter = Renter.new
    @user = User.find(params[:user_id])
  end

  def create
    @renter = Renter.new(renter_params)
    @renter.user = current_user
    if @renter.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    set_renter
    if @renter.update(renter_params)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def set_renter
    @user = User.find(params[:user_id])
  end

  def renter_params
    params.require(:renter).permit(:first_name, :last_name, :country, :user_id)
  end
end
