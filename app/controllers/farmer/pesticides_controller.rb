class Farmer::PesticidesController < ApplicationController
  before_action :authenticate_farmer!
  # before_action :set_farmer  で会員情報はまとめて取得できるよう訂正

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
    @season = current_farmer.seasons.last # 最新のシーズンを取得
    @farmlands = current_farmer.farmlands.all
    @usage_counts = {} # 各栽培区画での使用回数を格納するハッシュ
    
    if @season
      @farmlands_with_records = @pesticide.records.where(created_at: @season.start_date..@season.end_date).map(&:farmland).uniq
      @farmlands_with_records.each do |farmland|
        @usage_counts[farmland.land] = @pesticide.records.where(farmland: farmland, created_at: @season.start_date..@season.end_date).count
      end
    else
      # シーズンが設定されていない場合は全てのレコードをカウント
      @farmlands.each do |farmland|
        @usage_counts[farmland.land] = @pesticide.records.where(farmland: farmland).count
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

  def pesticide_params
     params.require(:pesticide).permit(:name, :code, :subject, :use_method, :magnification, :usable_number)
  end

end
