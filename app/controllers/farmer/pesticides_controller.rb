class Farmer::PesticidesController < ApplicationController
  before_action :authenticate_farmer!
  
  def index
    @farmer = Farmer.find(current_farmer.id)
  end

  def new
    @farmer = Farmer.find(current_farmer.id)
  end
  
  def create 
    @farmer = Farmer.find(current_farmer.id)
  end

  def show
    @farmer = Farmer.find(current_farmer.id)
  end
  
  def destroy
    @farmer = Farmer.find(current_farmer.id)
  end
  
  private

  def pesticide_params
     params.require(:pesticide).permit(:name, :code, :subject, :use_method, :magnification, :usable_number)
  end
  
end
