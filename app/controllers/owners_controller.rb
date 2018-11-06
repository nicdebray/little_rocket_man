class OwnersController < ApplicationController
  before_action :set_owner

  def show
  end

  def new
    @user = User.find(params[:user_id])
    @owner = Owner.new
  end

  def create
    @user = User.find(params[:user_id])
    @owner = Owner.new(owner_params)
    @owner.user = @user
    if @owner.save
      redirect_to user_path(@user)
    else
      render: new
    end
  end

  def edit
  end

  def update
    if @owner.update(owner_params)
      redirect_to user_path(@user)
    else
      render: new
    end
  end

  private
  def set_owner
    @owner = Owner.find(params[:id])
  end

  def owner_params
    params.require(:owner).permit(:company)
  end
end
