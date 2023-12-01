class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.string :city
      t.integer :user_id
      t.integer :public_rating
      t.boolean :private
      t.integer :user_rating
      t.integer :days_count
      t.integer :events_count
      t.integer :ratings_count

      t.timestamps
    end
  end
end
