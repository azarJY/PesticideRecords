class Farmer::SeasonsController < ApplicationController
  def new
  end
  def create
  end
  
  private
  
  def season_params
     params.require(:season).permit(:start_date, :end_date)
  end
end
