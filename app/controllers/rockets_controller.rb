class RocketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_rocket, only: [:show, :edit, :update, :destroy]
  def new
    @rocket = Rocket.new
    authorize @rocket
  end

  def index
    if params[:query].present?
      sql_query = " rockets.name ILIKE :query OR rockets.destination ILIKE :query"
      @rockets = Rocket.where(sql_query, query: "%#{params[:query]}%")
    else
      @rockets = Rocket.all
    end
    policy_scope(@rockets).order(created_at: :desc)
  end

  def create
    @rocket = Rocket.new(rocket_params)
    @rocket.user = current_user
    authorize @rocket
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
    authorize @rocket
  end

  def rocket_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:rocket).permit(:name, :capacity, :price, :destination, :user_id, :photo)
  end
end
