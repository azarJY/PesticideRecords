class Farmer::FarmlandsController < ApplicationController
  before_action :authenticate_farmer!
  before_action :check_guest, only: [:create, :destroy]

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
  
  def check_guest
    @farmer = Farmer.find(current_farmer.id)
    if @farmer.guest?
      redirect_to farmer_farmlands_path, alert: 'ゲストユーザーは作成や編集が行えません。'
    end
  end

  def farmland_params
     params.require(:farmland).permit(:land, :area, :overview)
  end

end
