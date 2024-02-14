class Farmer::SeasonsController < ApplicationController
  before_action :authenticate_farmer!
  
  def new
    @farmer = Farmer.find(current_farmer.id)
  end
  def create
    @farmer = Farmer.find(current_farmer.id)
  end
  
  private
  
  def season_params
     params.require(:season).permit(:start_date, :end_date)
  end
end
