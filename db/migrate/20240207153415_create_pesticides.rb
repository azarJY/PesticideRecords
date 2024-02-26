class CreatePesticides < ActiveRecord::Migration[6.1]
  def change
    create_table :pesticides do |t|
      t.integer :farmer_id, null: false
      t.string :name , null: false
      t.string :code , null: false
      t.string :subject , null: false
      t.string :use_method , null: false
      t.string :magnification , null: false
      t.integer :usable_number , null: false
      t.timestamps
    end
  end
end