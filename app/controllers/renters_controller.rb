class RentersController < ApplicationController
  before_action :set_renter, only: [:show, :edit, :update]

  def new
    @renter = Renter.new
  end

  def create
    @renter = Renter.new(renter_params)
    if @renter.save
      redirect_to renter_path(@renter)
    else
      render: new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @renter.update(renter_params)
      redirect_to renter_path(@renter)
    else
      render: new
    end
  end

  private

  def set_renter
    @renter = Renter.find(params[:id])
  end

  def renter_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:renter).permit(:first_name, :last_name, :country, :user_id)
  end
end
