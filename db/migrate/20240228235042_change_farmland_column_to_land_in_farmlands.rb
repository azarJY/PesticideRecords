class ChangeFarmlandColumnToLandInFarmlands < ActiveRecord::Migration[6.1]
  def change
    rename_column :farmlands, :farmland, :land
  end
end
