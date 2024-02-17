class Farmer::SeasonsController < ApplicationController
  before_action :authenticate_farmer!
  
  def new
    @farmer = Farmer.find(current_farmer.id)
    @season = Season.new
  end
  def create
    @farmer = Farmer.find(current_farmer.id)
    @season = Season.new(season_params)
    if @season.save
      redirect_to newfarmer_season_path, notice: 'Season was successfully created.'
    else
      render :new
    end
  end
  
  private
  
  def season_params
     params.require(:season).permit(:start_date, :end_date)
  end
end
