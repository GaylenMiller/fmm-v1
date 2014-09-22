class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :user_id
      t.string :vin
      t.string :license_state
      t.string :license_number
      t.string :distance_unit
      t.string :fuel_unit
      t.string :location_id
      t.string :model_year
      t.string :model_make
      t.string :model
      t.string :model_trim
      t.string :vehicle_type
      t.string :engine
      t.string :drive_type
      t.string :body_style
      t.string :doors

      t.timestamps
    end
  end
end
