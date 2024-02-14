class Farmer::RecordsController < ApplicationController
  before_action :authenticate_farmer!
  
  def index
    @farmer = Farmer.find(current_farmer.id)
  end

  def new
    @farmer = Farmer.find(current_farmer.id)
  end

  def confirm
    @farmer = Farmer.find(current_farmer.id)
    
  end
  
  def create
    @farmer = Farmer.find(current_farmer.id)
  end

  def show
    @farmer = Farmer.find(current_farmer.id)
  end

  def edit
    @farmer = Farmer.find(current_farmer.id)
  end
  
  def update
    @farmer = Farmer.find(current_farmer.id)
  end
  
  def destroy
    @farmer = Farmer.find(current_farmer.id)
  end
  
  private

  def record_params
     params.require(:record).permit(:day, :name, :subject, :code, :farmland, :amount, :water, :user, :confimer)
  end
  
end
