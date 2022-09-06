require "./lib/button_row.rb"
require "./lib/button_last_row.rb"
require "./lib/button_control_row.rb"
require "./lib/events.rb"

class Number_pad
	def initialize(ui, main_view_box, entry, clear_button, clear_all_button)
		create(ui, main_view_box, entry)
		@clear_button = clear_button
		@clear_all_button = clear_all_button
	end

	def create(ui, main_view_box, entry)
		padbox = ui.new_vertical_box
		ui.box_append(main_view_box, padbox, 1)

		3.times do |i|
			button_row = Button_row.new(ui, padbox, entry, i + 1)
			last = button_row.last
			ui.button_on_clicked(button_row.one.button) do 
				Events.number_entry_click ui, entry, (last - 2).to_s, @clear_button, @clear_all_button
			end
			ui.button_on_clicked(button_row.two.button) do 
				Events.number_entry_click ui, entry, (last - 1).to_s, @clear_button, @clear_all_button
			end
			ui.button_on_clicked(button_row.three.button) do 
				Events.number_entry_click ui, entry, (last).to_s, @clear_button, @clear_all_button
			end
		end
		button_last_row = Button_last_row.new(ui, padbox, entry)
		ui.button_on_clicked(button_last_row.star_button.button) do 
			Events.number_entry_click ui, entry, "*", @clear_button, @clear_all_button
		end
		ui.button_on_clicked(button_last_row.zero_button.button) do 
			Events.number_entry_click ui, entry, 0, @clear_button, @clear_all_button
		end
		ui.button_on_clicked(button_last_row.hash_button.button) do 
			Events.number_entry_click ui, entry, "#", @clear_button, @clear_all_button
		end

		Button_control_row.new(ui, padbox, entry)
	end
end
