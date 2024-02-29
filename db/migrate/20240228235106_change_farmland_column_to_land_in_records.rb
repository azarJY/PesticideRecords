class ChangeFarmlandColumnToLandInRecords < ActiveRecord::Migration[6.1]
  def change
    rename_column :records, :farmland, :land
  end
end
