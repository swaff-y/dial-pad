require "./lib/button.rb"

class Button_control_row
	attr_reader :call_button, :end_button
	def initialize(ui, control, entry)
		create(ui, control, entry)
	end

	def create(ui, control, entry)
		box = ui.new_horizontal_box
		ui.box_append(control, box, 1)
		ui.box_set_padded(box, 1)
		call_butt = Button.new(ui, box, nil, "Call", "control")
		@call_button = call_butt.button
		end_butt = Button.new(ui, box, nil, "End", "control")
		@end_button = end_butt.button
	end
end
