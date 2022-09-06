require "./lib/button.rb"

class Button_last_row
	attr_reader :star_button, :zero_button, :hash_button
	def initialize(ui, pad, entry)
		create(ui, pad, entry)
	end

	def create(ui, pad, entry)
		box = ui.new_horizontal_box
		ui.box_append(pad, box, 1)
 		@star_button = Button.new(ui, box, entry, "*", 	"number")
 		@zero_button = Button.new(ui, box, entry, 0, 	"number")
 		@hash_button = Button.new(ui, box, entry, "#", 	"number")
		ui.box_set_padded(box, 1)
	end
end
