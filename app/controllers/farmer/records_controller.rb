class Farmer::RecordsController < ApplicationController
  before_action :authenticate_farmer!
  before_action :check_guest, only: [:confirm, :create, :edit, :update, :destroy]

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
      @record.farmland.id = selected_farmland.id
      @record.land = selected_farmland.land
    end

    if params[:record][:pesticide_id].present?
      selected_pesticide = current_farmer.pesticides.find(params[:record][:pesticide_id])
      @record.pesticide.id = selected_pesticide.id
      @record.name = selected_pesticide.name
      @record.subject = selected_pesticide.subject
      @record.code = selected_pesticide.code
    end
    @record.day = params[:record][:day]
  end

  def create
    @farmer = Farmer.find(current_farmer.id)
    @record = current_farmer.records.new(record_params)

    Rails.logger.debug params[:record][:day]

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
    @record = current_farmer.records.find(params[:id])
  end

  def edit
    @farmer = Farmer.find(current_farmer.id)
    @record = current_farmer.records.find(params[:id])
  end

  def update
    @farmer = Farmer.find(current_farmer.id)
    @record = current_farmer.records.find(params[:id])
    if @record.update(record_params)
      flash[:notice] = "農薬使用記録の編集に成功しました。"
      redirect_to farmer_records_path
    else
      flash[:notice] = "農薬使用記録の編集に失敗しました。"
      render :edit
    end
  end

  def destroy
    @farmer = Farmer.find(current_farmer.id)
    @record = current_farmer.records.find(params[:id])
    if @record.destroy
      flash[:notice] = "農薬使用記録の削除に成功しました。"
      redirect_to farmer_records_path
    else
      flash[:notice] = "農薬使用記録の削除に失敗しました。"
      render :edit
    end
  end

  private
  
  def check_guest
    @farmer = Farmer.find(current_farmer.id)
    if @farmer.guest?
      redirect_to farmer_records_path, alert: 'ゲストユーザーは記録の作成や編集が行えません。'
    end
  end

  def record_params
     params.require(:record).permit(:day, :farmland_id, :pesticide_id, :name, :subject, :code, :land, :amount, :water, :user, :confimer)
  end

end