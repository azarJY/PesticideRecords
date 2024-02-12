class Farmer::CurrentFarmersController < ApplicationController
  def show
  end

  def edit
  end
  
  def update
  end

  def confirm
  end

  def destroy
  end
  
  private

  def farmer_params
     params.require(:farmer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :farm_name, :crop, :email, :password, :password_confirmation)
  end
  
end
