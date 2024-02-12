class Farmer::RecordsController < ApplicationController
  
  def index
  end

  def new
  end

  def confirm
  end
  
  def create
  end

  def show
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private

  def record_params
     params.require(:record).permit(:day, :name, :subject, :code, :farmland, :amount, :water, :user, :confimer)
  end
  
end
