class UsersController < ApplicationController
  before_action :find_user
  def show

  end

  def edit
  end

  def update
    @user.update(params_user)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def params_user
    params.require(:user).permit(:first_name, :last_name, :photo)
  end
end
