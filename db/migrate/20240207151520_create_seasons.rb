class CreateSeasons < ActiveRecord::Migration[6.1]
  def change
    create_table :seasons do |t|
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
