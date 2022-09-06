require "./lib/button.rb"

class Button_row
	attr_reader :one, :two, :three, :last
	def initialize(ui, pad, entry, number)
		create(ui, pad, entry, number)
	end

	def create(ui, pad, entry, number)
		@last = number * 3
		box = ui.new_horizontal_box
		ui.box_append(pad, box, 1)
		ui.box_set_padded(box, 1)
 		@one = 		Button.new(ui, box, entry, @last - 2,	"number")
 		@two = 		Button.new(ui, box, entry, @last - 1,	"number")
 		@three = 	Button.new(ui, box, entry, @last,		"number")
	end
end
