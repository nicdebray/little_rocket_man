class OwnersController < ApplicationController
  before_action :set_owner

  def show
  end

  def new
    @owner = Owner.new
    @user = User.find(params[:user_id])

  end

  def create
    @owner = Owner.new(owner_params)
    @owner = current_user
    if @owner.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    set_owner
    if @owner.update(owner_params)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private
  def set_owner
    @user = User.find(params[:user_id])

  end

  def owner_params
    params.require(:owner).permit(:company, :user_id)
  end
end
