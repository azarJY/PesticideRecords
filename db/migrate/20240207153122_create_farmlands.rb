class CreateFarmlands < ActiveRecord::Migration[6.1]
  def change
    create_table :farmlands do |t|

      t.timestamps
    end
  end
end
