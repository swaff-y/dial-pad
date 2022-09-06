require "./lib/number_pad.rb"
require "./lib/entry.rb"
require "./lib/main_window.rb"
require "./lib/close.rb"
require "./lib/events.rb"

class Dial_pad
	def initialize ui, call
		ui.init
		make_main_window(ui)
		make_input(ui, call)
		make_number_pad(ui, call)
		handle_closing(ui)
		handle_control_show(ui)
		handle_main_and_quit(ui)
	end
	
	def make_main_window(ui)
		main = Main_window.new(ui, "Dial Pad", 300,	300)
		@main_window = main.mw
		@mvbox = main.mvbox
	end

	#display call state
	
	def make_input(ui, call)
		entry_comp = Entry.new(ui, @mvbox)
		@entry = entry_comp.entry
		@display_box = entry_comp.display_box
		@clear_button = entry_comp.clear_button
		@clear_all_button = entry_comp.clear_all_button

		Events.entry_change ui, @entry, @clear_button, @clear_all_button
		Events.handle_display ui, @display_box, call
	end
	
	def	make_number_pad(ui, call)
		Number_pad.new(ui, @mvbox, @entry, @clear_button, @clear_all_button)
	end

	#control pad
	
	def	handle_closing(ui)
		Closer.create(ui, @main_window)
	end
	
	def	handle_control_show(ui)
		ui.control_show(@main_window)
	end
	
	def	handle_main_and_quit(ui)
		ui.main
		ui.quit
	end
end
