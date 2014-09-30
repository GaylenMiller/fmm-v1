class Car < ActiveRecord::Base
	belongs_to :user

	validates :user_id, presence: true

	def model_description
		(model_year || "") + " " + (model_make || "") + " " + (model || "") + " " + (model_trim || "")
	end
end
