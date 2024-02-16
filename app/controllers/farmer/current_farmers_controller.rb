class Farmer::CurrentFarmersController < ApplicationController
  before_action :authenticate_farmer!
  
  def show
    @farmer = Farmer.find(current_farmer.id)
  end

  def edit
    @farmer = Farmer.find(current_farmer.id)
  end
  
  def update
    @farmer = Farmer.find(current_farmer.id)
    @farmer.update(farmer_params)
    redirect_to farmer_current_farmer_path
  end
  
  def confirm
    @farmer = Farmer.find(current_farmer.id)
  end

  def destroy
    @farmer = Farmer.find(current_farmer.id)
    @farmer.destroy
    redirect_to root_path
  end
  
  private

  def farmer_params
     params.require(:farmer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :farm_name, :crop, :email, :password, :password_confirmation)
  end
  
end