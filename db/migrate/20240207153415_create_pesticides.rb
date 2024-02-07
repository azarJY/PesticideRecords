class CreatePesticides < ActiveRecord::Migration[6.1]
  def change
    create_table :pesticides do |t|

      t.timestamps
    end
  end
end
