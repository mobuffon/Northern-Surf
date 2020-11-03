class UspotsController < ApplicationController
  def index
    @uspots = current_user.uspots
  end

  def create
    @uspot = Uspot.new(uspot_params)

    if @uspot.save
      redirect_to spots_path, notice: "Spot was added to your spots"
    else
      redirect_to spots_path, notice: "creation failed"
    end
  end

  def destroy
  end

  def uspot_params
    params.permit(:user_id, :spot_id)
  end
end
