class SelectOption < ActiveRecord::Base

	validates :domain, :code_value, :display_value, presence: true
end
