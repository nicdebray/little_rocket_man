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
    @rocket.save

    # no need for app/views/restaurants/create.html.erb
    redirect_to rocket_path(@rocket)
  end

  def show
  end

  def edit
  end

  def update
    @rocket.update(rocket_params)
    redirect_to rocket_path(@rocket)
  end

  def destroy
    @rocket.destroy
    redirect_to rocket_path
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
