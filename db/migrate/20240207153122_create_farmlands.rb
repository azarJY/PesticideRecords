class CreateFarmlands < ActiveRecord::Migration[6.1]
  def change
    create_table :farmlands do |t|
      t.integer :farmer_id, null: false
      t.string :farmland , null: false
      t.string :area , null: false
      t.text :overview , null: false
      t.timestamps
    end
  end
end
