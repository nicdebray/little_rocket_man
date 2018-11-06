class RocketsController < ApplicationController
  before_action :set_rocket, only: [:show, :edit, :update, :destroy]
  def new
    @rocket = Rocket.new
  end

  def index
    @rockets = Rocket.all
  end

  def create
    @rocket = Rocket.new(rocket_params)
    if @rocket.save
      redirect_to rockets_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @rocket.update(rocket_params)
      redirect_to rocket_path(@rocket)
    else
      render :new
    end
  end

  def destroy
    @rocket.destroy
    if @rocket.destroy
      redirect_to rockets_path
    else
      render :new
    end
  end

  private
  def set_rocket
    @rocket = Rocket.find(params[:id])
  end

  def rocket_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:rocket).permit(:type, :capacity, :price, :destination, :user_id)
    end
end
