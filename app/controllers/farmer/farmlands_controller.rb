class Farmer::FarmlandsController < ApplicationController
  before_action :authenticate_farmer!

  def index
    @farmer = Farmer.find(current_farmer.id)
    @farmlands = Farmland.all
    #pesticide_ids = @pesticides.pluck(:id)
    #@records = Record.where(pesticide_id: pesticide_ids)
  end

  def new
    @farmland = Farmland.new
    @farmer = Farmer.find(current_farmer.id)
  end

  def create
    @farmer = Farmer.find(current_farmer.id)
    @farmland = Farmland.new(farmland_params)
    @farmland.save
    redirect_to farmer_farmland_path(@farmer, @farmland.id)
  end

  def show
    @farmer = Farmer.find_by(id: current_farmer.id)
    @farmland = @farmer.farmlands.find_by(id: params[:id])
    puts "@farmland: #{@farmland.inspect}"
    @records = Record.all
  end

  def destroy
    @farmer = Farmer.find(current_farmer.id)
    @farmland = @farmer.farmlands.find(id: params[:id])
    @farmland.destroy
    redirect_to farmer_farmlands_path
  end

  private

  def farmland_params
     params.require(:farmland).permit(:farmland, :area, :overview)
  end

end
