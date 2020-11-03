class AddWindyDaysToSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :windy_days, :string
  end
end
