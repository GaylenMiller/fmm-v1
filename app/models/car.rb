class Car < ActiveRecord::Base
	belongs_to :user

	def model_description
		(model_year || "") + " " + (model_make || "") + " " + (model || "") + " " + (model_trim || "")
	end
end
