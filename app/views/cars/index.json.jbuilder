json.array!(@cars) do |car|
  json.extract! car, :id, :user_id, :vin, :license_state, :license_number, :distance_unit, :fuel_unit, :location_id, :model_year, :model_make, :model, :model_trim, :vehicle_type, :engine, :drive_type, :body_style, :doors
  json.url car_url(car, format: :json)
end
