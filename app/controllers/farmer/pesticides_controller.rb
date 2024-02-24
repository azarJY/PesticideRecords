class Farmer::PesticidesController < ApplicationController
  before_action :authenticate_farmer!
  
  def index
    @farmer = Farmer.find(current_farmer.id)
    @pesticides = current_farmer.pesticides.all
    #pesticide_ids = @pesticides.pluck(:id)
    #@records = Record.where(pesticide_id: pesticide_ids)
  end

  def new
    @farmer = Farmer.find(current_farmer.id)
    @pesticide = Pesticide.new
  end
  
  def create 
    @farmer = Farmer.find(current_farmer.id)
    @pesticide = current_farmer.pesticide.new(pesticide_params)
    if  @pesticide.save
      flash[:notice] = "農薬の追加に成功しました。"
      redirect_to farmer_pesticides_path
    else
      flash[:notice] = "農薬の追加に失敗しました"
      @pesticide = Pesticide.new
      @farmer = Farmer.find(current_farmer.id)
      render :new
    end
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
