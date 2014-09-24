module ApplicationHelper

	# Return the bootstrap class for the flash
	def bootstrap_class_for flash_type
	    case flash_type
	      when :success, "success"
	        "alert-success"
	      when :error, "error"
	        "alert-danger"
	      when :alert, "alert"
	        "alert-warning"
	      else
	        "alert-info"
	    end
	end

	# Returns the full title on a per-page basis.
	def full_title(page_title = '')
		base_title = "Fuel My Maintenance"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end
