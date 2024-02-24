class Farmer::FarmlandsController < ApplicationController
  before_action :authenticate_farmer!

  def index
    @farmer = Farmer.find(current_farmer.id)
    @farmlands = current_farmer.farmlands.all
    #pesticide_ids = @pesticides.pluck(:id)
    #@records = Record.where(pesticide_id: pesticide_ids)
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
    @farmland = @farmer.farmlands.find(params[:id])
    @records = Record.all
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
