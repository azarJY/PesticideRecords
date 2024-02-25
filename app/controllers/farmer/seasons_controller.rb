class Farmer::SeasonsController < ApplicationController
  before_action :authenticate_farmer!
  # before_action :set_farmer  で会員情報はまとめて取得できるよう訂正
  
  def new
    @farmer = Farmer.find(current_farmer.id)
    @season = Season.new
  end
  def create
    @farmer = Farmer.find(current_farmer.id)
    @season = current_farmer.season.new(season_params)
    if @season.save
      flash[:notice] = "シーズン時期の設定に成功しました。"
      redirect_to newfarmer_season_path
    else
      flash[:notice] = "シーズン時期の設定に失敗しました。"
      render :new
    end
  end
  
  private
  
  def season_params
     params.require(:season).permit(:start_date, :end_date)
  end
end
