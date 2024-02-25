class Farmer::RecordsController < ApplicationController
  before_action :authenticate_farmer!
  # before_action :set_farmer  で会員情報はまとめて取得できるよう訂正
  
  def index
    @farmer = Farmer.find(current_farmer.id)
    @records = Record.all
  end

  def new
    @farmer = Farmer.find(current_farmer.id)
    @record = Record.new
  end

  def confirm
    @farmer = Farmer.find(current_farmer.id)
    @record = Record.new(record_params)
    
    if params[:record][:farmland_select_id] == "0"
    @record = Record.new(record_params)
    @record.farmland = Record.find(params[:record][:farmland_id]).farmland
    end
    
    if params[:record][:pesticide_select_id] == "1"
    @record = Record.new(record_params)
    @record.name = Record.find(params[:record][:pesticide_id]).name
    @record.subject = Record.find(params[:record][:pesticide_id]).subject
    @record.code = Record.find(params[:record][:pesticide_id]).code
    end
  end
  
  def create
    @farmer = Farmer.find(current_farmer.id)
    @record = current_farmer.records.new(record_params)
    
    current_farmer.farmlands.each do |farmland|
      @record = Record.new
      @record.farmland = farmland.farmland
    end
    
    current_farmer.pesticides.each do |pesticide|
      @record = Record.new
      @record.name = pesticide.name
      @record.subject = pesticide.subject
      @record.code = pesticide.code
    end
    @record.save
    redirect_to farmer_records_path
  end

  def show
    @farmer = Farmer.find(current_farmer.id)
    @record = Record.find(params[:id])
  end

  def edit
    @farmer = Farmer.find(current_farmer.id)
    @record = Record.find(params[:id])
  end
  
  def update
    @farmer = Farmer.find(current_farmer.id)
    @record = Record.find(params[:id])
    record.update(record.params)
    redirect_to farmer_records_path
  end
  
  def destroy
    @farmer = Farmer.find(current_farmer.id)
    @record = Record.find(params[:id])
    record.destroy
    redirect_to farmer_records_path
  end
  
  private

  def record_params
     params.require(:record).permit(:day, :name, :subject, :code, :farmland, :amount, :water, :user, :confimer)
  end
  
end
