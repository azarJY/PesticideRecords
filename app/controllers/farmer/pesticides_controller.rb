class Farmer::PesticidesController < ApplicationController
  before_action :authenticate_farmer!
  
  def index
    @farmer = Farmer.find(current_farmer.id)
    @pesticides = Pesticide.all
    @record = Record.find(record.id)
  end

  def new
    @farmer = Farmer.find(current_farmer.id)
    @pesticide = Pesticide.new
  end
  
  def create 
    @farmer = Farmer.find(current_farmer.id)
    @pesticide = Pesticide.new(pesticide_params)
    @pesticide.save
    redirect_to farmer_pesticides_
  end

  def show
    @farmer = Farmer.find(current_farmer.id)
    @pesticide = Pesticide.find(params[:id])
    @season = Season.find_by(id: params[:season_id]) # season_idで期間を指定
    @farmland = Farmland.find(params[:farmland_id]) # farmland_idで栽培区画を指定
    @usage_records = @pesticide.usage_records.records_within_season(@season).where(farmland_id: @farmland.id)
    @record_count = @usage_records.count
  end
  
  def destroy
    @farmer = Farmer.find(current_farmer.id)
    @pesticide = Pesticide.find(params[:id])
    pesticide.destroy
    redirect_to farmer_pesticides_path
  end
  
  private

  def pesticide_params
     params.require(:pesticide).permit(:name, :code, :subject, :use_method, :magnification, :usable_number)
  end
  
end
