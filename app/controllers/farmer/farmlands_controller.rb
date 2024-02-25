class Farmer::FarmlandsController < ApplicationController
  before_action :authenticate_farmer!
  # before_action :set_farmer  で会員情報はまとめて取得できるよう訂正

  def index
    @farmer = Farmer.find(current_farmer.id)
    @farmlands = current_farmer.farmlands.all
  end

  def new
    @farmland = Farmland.new
    @farmer = Farmer.find(current_farmer.id)
  end

  def create
    @farmer = Farmer.find(current_farmer.id)
    @farmland = current_farmer.farmlands.new(farmland_params)
    if  @farmland.save
      flash[:notice] = "栽培区画の設定に成功しました。"
      redirect_to farmer_farmlands_path
    else
      flash[:notice] = "栽培区画の設定に失敗しました"
      @farmland = Farmland.new
      @farmer = Farmer.find(current_farmer.id)
      render :new
    end
  end

  def show
    @farmer = Farmer.find(current_farmer.id)
    @farmland = current_farmer.farmlands.find(params[:id])
  end

  def destroy
    @farmer = Farmer.find(current_farmer.id)
    @farmland = @farmer.farmlands.find(params[:id])
    @farmland.destroy
    redirect_to farmer_farmlands_path
  end

  private

  def farmland_params
     params.require(:farmland).permit(:farmland, :area, :overview)
  end

end
