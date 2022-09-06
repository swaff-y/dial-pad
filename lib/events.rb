class Events 

	def self.number_entry_click ui, entry, content, clear_button, clear_all_button
		puts "#{content} clicked"
		text = ui.entry_text(entry)
		ui.entry_set_text(entry, "#{text}#{content}") 
		text = ui.entry_text(entry).to_s
		$stdout.flush # For Windows

		if text.length > 0 
			ui.control_enable(clear_button)
			ui.control_enable(clear_all_button)
			"enabled"
		else
			ui.control_disable(clear_button)
			ui.control_disable(clear_all_button)
			"disabled"
		end
	end

	def self.entry_change ui, entry, clear_button, clear_all_button
		text = ui.entry_text(entry).to_s
		$stdout.flush # For Windows
		if text.length > 0 
			ui.control_enable(clear_button)
			ui.control_enable(clear_all_button)
			"enabled"
		else
			ui.control_disable(clear_button)
			ui.control_disable(clear_all_button)
			"disabled"
		end
	end

	def self.clear_all_click ui, entry
		true if ui.entry_set_text(entry, "")
	end

	def self.clear_click ui, entry
		text = ui.entry_text(entry).to_s
		last_char = text[-1, 1]
		text = text.chomp(last_char)
		ui.entry_set_text(entry, text) 
		true if text
	end

	def self.handle_display ui, display_box, call
		call_status = call.call_status.to_s
		label = ui.new_label(call_status)
		ui.box_append(display_box, label, 1)
	end
end
