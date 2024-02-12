class Farmer::FarmlandsController < ApplicationController
  def index
  end

  def new
  end
  
  def create 
  end

  def show
  end
  
  def destroy
  end
  
  private

  def farmland_params
     params.require(:farmland).permit(:farmland, :area, :overview)
  end
  
end
