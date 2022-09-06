class Main_window
	attr_reader :mw, :mvbox

	def initialize(ui, window_name, window_width, window_height)
		main_window(ui, window_name, window_width, window_height)
		window_box(ui)
		create(ui)
	end

	def create(ui)
		ui.window_set_child(@mw, @mvbox)
	end

	def main_window(ui, window_name, window_width, window_height)
		@mw = ui.new_window(window_name, window_width, window_height, 1);
	end

	def window_box(ui)
		@mvbox = ui.new_vertical_box
	end
end
