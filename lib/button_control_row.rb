require "./lib/button.rb"

class Button_control_row
	def initialize(ui, control, entry)
		create(ui, control, entry)
	end

	def create(ui, control, entry)
		box = ui.new_horizontal_box
		ui.box_append(control, box, 1)
		ui.box_set_padded(box, 1)
		Button.new(ui, box, nil, "Call", "control")
		Button.new(ui, box, nil, "End", "control")
	end
end
