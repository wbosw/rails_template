class CreateDays < ActiveRecord::Migration[7.0]
  def change
    create_table :days do |t|
      t.integer :trip_id
      t.date :date
      t.string :name
      t.string :lodging
      t.integer :events_count

      t.timestamps
    end
  end
end
