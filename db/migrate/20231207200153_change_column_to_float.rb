class ChangeColumnToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column(:trips, :public_rating, :float)
  end
end
