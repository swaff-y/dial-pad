 module Events 
	def make_button_hash button, type
		{
			button: button,
			type: type
		}
	end

	def number_entry_click ui, entry, content, buttons
		puts "#{content} clicked"
		text = ui.entry_text(entry)
		ui.entry_set_text(entry, "#{text}#{content}") 
		text = ui.entry_text(entry).to_s
		$stdout.flush # For Windows

		buttons.each do |button|
			control_change(ui, text, button[:button], button[:type])
		end
		true
	end

	def entry_change ui, entry, buttons
		text = ui.entry_text(entry).to_s
		$stdout.flush # For Windows
		buttons.each do | button |
			control_change(ui, text, button[:button], button[:type])
		end
		true
	end

	def clear_all_click ui, entry, buttons
		ui.entry_set_text(entry, "")
		text = ui.entry_text(entry).to_s
		control_change(ui, text, buttons[0][:button], buttons[0][:type])
		true
	end

	def clear_click ui, entry, buttons
		text = ui.entry_text(entry).to_s
		last_char = text[-1, 1]
		text = text.chomp(last_char)
		ui.entry_set_text(entry, text) 
		if text
			control_change(ui, text, buttons[0][:button], buttons[0][:type])
			true
		end
	end

	def handle_display ui, display_box, call
		labels = [ ]

		number_box = ui.new_horizontal_box
		status_box = ui.new_horizontal_box
		ui.box_append(display_box, number_box, 1)
		ui.box_append(display_box, status_box, 1)

		call_status = call.call_status.to_s
		number_label = ui.new_label("")
		labels.push(number_label)
		status_label = ui.new_label(call_status)
		labels.push(status_label)
		ui.box_append(number_box, number_label, 1)
		ui.box_append(status_box, status_label, 1)
		labels
	end

	def handle_call_click ui, buttons, entry, labels, call 
		call_set_number_in_display(ui, entry, labels[0])
		call_disable_call_button(ui, buttons)
		call_update_call_status(ui, call)
		call_enable_end_button(ui, buttons)
		true
	end

# 	private

	def call_set_number_in_display ui, entry, label
		text = ui.entry_text(entry).to_s
		ui.label_set_text(label, text)
	end

	def call_disable_call_button ui, buttons
		buttons.each do |button|
			if button[:type] == "call"
				ui.control_disable(button[:button])
			end
		end
	end

	def call_update_call_status ui, call
		call.set_call_status("ringing")
	end

	def call_enable_end_button ui, buttons
		buttons.each do |button|
			if button[:type] == "end"
				ui.control_enable(button[:button])
			end
		end
	end

	def control_change ui, text, button, type
		if ((text.length > 0) && (type == "clear"))
			ui.control_enable(button)
			"enabled"
		elsif ((text.length > 9) && (type == "call"))
			ui.control_enable(button)
			"enabled"
		else
			ui.control_disable(button)
			"disabled"
		end
	end
end
