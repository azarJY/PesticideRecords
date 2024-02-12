class Farmer::PesticidesController < ApplicationController
  
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

  def pesticide_params
     params.require(:pesticide).permit(:name, :code, :subject, :use_method, :magnification, :usable_number)
  end
  
end
