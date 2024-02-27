class Farmer::RecordsController < ApplicationController
  before_action :authenticate_farmer!
  # before_action :set_farmer  で会員情報はまとめて取得できるよう訂正

  def index
    @farmer = Farmer.find(current_farmer.id)
    @records = current_farmer.records.all
  end

  def new
    @farmer = Farmer.find(current_farmer.id)
    @record = Record.new
  end

  def confirm
    @farmer = Farmer.find(current_farmer.id)
    @record = Record.new(record_params)

    if params[:record][:farmland_id].present?
        selected_farmland = current_farmer.farmlands.find(params[:record][:farmland_id])
        @record.farmland = selected_farmland
        @record.farmland.id =selected_farmland.id
        @record.farmland.farmland = selected_farmland.farmland
    end

    if params[:record][:pesticide_id].present?
      selected_pesticide = current_farmer.pesticides.find(params[:record][:pesticide_id])
      @record.pesticide = selected_pesticide
      @record.pesticide.id = selected_pesticide.id
      @record.name = selected_pesticide.name
      @record.subject = selected_pesticide.subject
      @record.code = selected_pesticide.code
    end
  end

  def create
    @farmer = Farmer.find(current_farmer.id)
    @record = current_farmer.records.new(record_params)

    if @record.save
      flash[:notice] = "農薬使用記録の作成に成功しました。"
      redirect_to farmer_records_path
    else
      flash[:notice] = "農薬使用記録の作成に失敗しました。"
      render :new
    end
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
     params.require(:record).permit(:day, :farmland_id, :pesticide_id, :name, :subject, :code, :farmland, :amount, :water, :user, :confimer)
  end

end