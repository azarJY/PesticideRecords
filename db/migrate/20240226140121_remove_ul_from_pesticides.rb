class RemoveUlFromPesticides < ActiveRecord::Migration[6.1]
  def change
    remove_column :pesticides, :ur, :text
  end
end
