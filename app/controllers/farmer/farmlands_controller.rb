class Farmer::FarmlandsController < ApplicationController
  before_action :authenticate_farmer!
  
  def index
    @farmer = Farmer.find(current_farmer.id)
    @farmlands = Farmland.all
    @record = Record.find(record.id)
  end

  def new
    @farmland = Farmland.new
    @farmer = Farmer.find(current_farmer.id)
  end
  
  def create
    @farmer = Farmer.find(current_farmer.id)
    @farmland = Farmland.new(farmland_params)
    @farmland.save
    redirect_to farmer_farmland_path(@farmland)
  end

  def show
    @farmer = Farmer.find(current_farmer.id)
    @farmland = Farmland.find(params[:id])
    @records = Record.all
  end
  
  def destroy
    @farmer = Farmer.find(current_farmer.id)
    farmland = Farmland.find(params[:id])
    farmland.destroy
    redirect_to farmer_farmlands_path
  end
  
  private

  def farmland_params
     params.require(:farmland).permit(:farmland, :area, :overview)
  end
  
end
