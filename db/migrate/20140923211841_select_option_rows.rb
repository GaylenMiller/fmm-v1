class SelectOptionRows < ActiveRecord::Migration
  def change
  	SelectOption.create(domain: "distance", code_value: "K", display_value: "Kilometer")
  	SelectOption.create(domain: "distance", code_value: "M", display_value: "Mile")
  	SelectOption.create(domain: "fuel", code_value: "L", display_value: "Liter")
  	SelectOption.create(domain: "fuel", code_value: "GUS", display_value: "Gallon US")
  	SelectOption.create(domain: "fuel", code_value: "GIMP", display_value: "Gallon Imperial")
  end
end
