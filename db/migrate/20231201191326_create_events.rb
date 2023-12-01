class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.integer :day_id
      t.string :notes
      t.integer :trip_id
      t.datetime :time

      t.timestamps
    end
  end
end
