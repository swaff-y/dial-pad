require "./lib/button_row.rb"
require "./lib/button_last_row.rb"
require "./lib/button_control_row.rb"
require "./lib/events.rb"

class Number_pad
	include Events
	def initialize( ui, main_view_box, entry, buttons, entry_comp, labels, call )
		@buttons = buttons
		@labels = labels
		@entry_comp = entry_comp
		@call = call
		create(ui, main_view_box, entry)
	end

	def create(ui, main_view_box, entry)
		padbox = ui.new_vertical_box
		ui.box_append(main_view_box, padbox, 1)

		3.times do |i|
			button_row = Button_row.new(ui, padbox, entry, i + 1)
			last = button_row.last
			ui.button_on_clicked(button_row.one.button) do 
				number_entry_click ui, entry, (last - 2).to_s, @buttons
			end
			ui.button_on_clicked(button_row.two.button) do 
				number_entry_click ui, entry, (last - 1).to_s, @buttons
			end
			ui.button_on_clicked(button_row.three.button) do 
				number_entry_click ui, entry, (last).to_s, @buttons
			end
		end
		button_last_row = Button_last_row.new(ui, padbox, entry)
		ui.button_on_clicked(button_last_row.star_button.button) do 
			number_entry_click ui, entry, "*", @buttons
		end
		ui.button_on_clicked(button_last_row.zero_button.button) do 
			number_entry_click ui, entry, 0, @buttons
		end
		ui.button_on_clicked(button_last_row.hash_button.button) do 
			number_entry_click ui, entry, "#", @buttons
		end

		control_button_row = Button_control_row.new(ui, padbox, entry)
		handle_clear_clickers(ui, control_button_row, entry, @entry_comp, @buttons)
	end

	def handle_clear_clickers ui, button_row, entry, entry_comp, buttons 
		control_buttons = []

		#call button
		call_button = make_button_hash(button_row.call_button, "call")
 		buttons.push(call_button)
		control_buttons.push(call_button)

		#end button
		end_button = make_button_hash(button_row.end_button, "end")
 		buttons.push(end_button)
		control_buttons.push(end_button)

		handle_control_clickers(ui, buttons, entry, @labels)
		entry_comp.set_clear_clickers ui, entry, control_buttons
	end
	
	def handle_control_clickers ui, buttons, entry, labels
		buttons.each do |button|
			if button[:type] == "call"
				ui.button_on_clicked(button[:button]) do
					handle_call_click(ui, buttons, entry, labels, @call)
				end
			end
			if button[:type] == "end"
				ui.button_on_clicked(button[:button]) do
					puts "end click"
				end
			end
		end
	end
end
