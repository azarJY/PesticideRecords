class Farmer::FarmlandsController < ApplicationController
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

  def farmland_params
     params.require(:farmland).permit(:farmland, :area, :overview)
  end
  
end
