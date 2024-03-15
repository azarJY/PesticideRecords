class Farmer::PesticidesController < ApplicationController
  before_action :authenticate_farmer!
  before_action :check_guest, only: [:create, :destroy]
  
  def index
    @farmer = Farmer.find(current_farmer.id)
    @pesticides = current_farmer.pesticides.all
  end

  def new
    @farmer = Farmer.find(current_farmer.id)
    @pesticide = Pesticide.new
  end

  def create
    @farmer = Farmer.find(current_farmer.id)
    @pesticide = current_farmer.pesticides.new(pesticide_params)
    if @pesticide.save
      flash[:notice] = "農薬の追加に成功しました。"
      redirect_to farmer_pesticides_path
    else
      flash[:notice] = "農薬の追加に失敗しました"
      render :new
    end
  end

  def show
    @farmer = Farmer.find(current_farmer.id)
    @pesticide = current_farmer.pesticides.find(params[:id])
    @season = current_farmer.seasons.last
    @farmlands = current_farmer.farmlands.all

    if @season # シーズン未設定の場合のエラー回避
      @records_within_season = @pesticide.records.where(day: @season.start_date..@season.end_date)
    else
      @records_within_season = @pesticide.records
    end

    @farmlands_with_records = @records_within_season.map(&:farmland).uniq
    @usage_counts = {}
    @farmlands_with_records.each do |farmland|
      if farmland.present?
        @usage_counts[farmland.land] = @records_within_season.where(farmland: farmland).count
      end
    end
  end

  def destroy
    @farmer = Farmer.find(current_farmer.id)
    @pesticide = current_farmer.pesticides.find(params[:id])
    @pesticide.destroy
    redirect_to farmer_pesticides_path
  end

  private
  
  def check_guest
    @farmer = Farmer.find(current_farmer.id)
    if @farmer.guest?
      redirect_to farmer_pesticides_path, alert: 'ゲストユーザーは作成や編集が行えません。。'
    end
  end

  def pesticide_params
     params.require(:pesticide).permit(:name, :code, :subject, :use_method, :magnification, :usable_number)
  end

end
