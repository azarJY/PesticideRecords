class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.integer :farmer_id, null: false
      t.integer :farmland_id, null: false
      t.integer :pesticide_id, null: false
      t.date :day , null: false
      t.string :name , null: false
      t.string :subject , null: false
      t.string :code , null: false
      t.string :farmland , null: false
      t.string :amount , null: false
      t.string :water , null: false
      t.string :user , null: false
      t.string :confimer , null: false
      t.timestamps
    end
  end
end
