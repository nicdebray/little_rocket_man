class RentersController < ApplicationController
  before_action :authenticate_user!
  def new
    @renter = Renter.new
    @user = User.find(params[:user_id])
    authorize @renter
  end

  def create
    @renter = Renter.new(renter_params)
    @renter.user = current_user
    authorize @renter
    if @renter.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def show
    authorize @renter
  end

  def edit
    @renter = current_user.renter
    authorize @renter
  end

  def update
    @renter = current_user.renter
    authorize @renter
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
