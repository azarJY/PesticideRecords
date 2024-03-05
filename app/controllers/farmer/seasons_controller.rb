class Farmer::SeasonsController < ApplicationController
  before_action :authenticate_farmer!
  before_action :check_guest, only: [:create]
  
  def new
    @farmer = Farmer.find(current_farmer.id)
    @season = Season.new
  end
  
  def create
    @farmer = Farmer.find(current_farmer.id)
    @season = current_farmer.seasons.new(season_params)
    if @season.save
      flash[:notice] = "シーズン時期の設定に成功しました。"
      redirect_to new_farmer_season_path
    else
      flash[:notice] = "シーズン時期の設定に失敗しました。"
      render :new
    end
  end
  
  private
  
  def check_guest
    @farmer = Farmer.find(current_farmer.id)
    if @farmer.guest?
      redirect_to new_farmer_season_path, alert: 'ゲストユーザーはシーズンが行えません。'
    end
  end
  
  def season_params
     params.require(:season).permit(:start_date, :end_date)
  end
end
