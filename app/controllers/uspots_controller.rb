class UspotsController < ApplicationController
  before_action :find_uspot, only: :destroy

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
    @uspot.destroy
    respond_to do |format|
      format.html { redirect_to user_uspots_url, notice: 'Spot was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_uspot
    @uspot = Uspot.find(params[:id])
  end

  def uspot_params
    params.permit(:user_id, :spot_id)
  end
end
