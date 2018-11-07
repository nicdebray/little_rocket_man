class OwnersController < ApplicationController


  def show
  end

  def new
    @owner = Owner.new
    @user = current_user
  end

  def create
    @owner = Owner.new(owner_params)
    @owner.user = current_user
    if @owner.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    @owner = current_user.owner
  end

  def update
    @owner = current_user.owner
    if @owner.update(owner_params)
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def owner_params
    params.require(:owner).permit(:company, :user_id)
  end
end
