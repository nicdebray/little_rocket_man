class RentersController < ApplicationController
  before_action :set_renter, only: [:show, :edit, :update]

  def new
    @renter = Renter.new
    @user = User.find(params[:user_id])
  end

  def create
    @renter = Renter.new(renter_params)
    set_user
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
    set_user
    if @renter.update(renter_params)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private
  def set_user
    @user = User.find(params[:user_id])
    @renter.user = @user
  end

  def set_renter
    @renter = Renter.find(params[:id])
  end

  def renter_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:renter).permit(:first_name, :last_name, :country, :user_id)
  end
end
