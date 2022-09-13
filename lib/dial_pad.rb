require "./lib/number_pad.rb"
require "./lib/entry.rb"
require "./lib/main_window.rb"
require "./lib/close.rb"
require "./lib/events.rb"

class Dial_pad
	include Events
	def initialize ui, call
		@ui = ui
		ui.init
		make_main_window(ui)
		make_input(ui, call)
		make_number_pad(ui, call)
		handle_closing(ui)
		handle_control_show(ui)
		handle_main_and_quit(ui)
	end
	
	def status_changed call_status
		@ui.label_set_text(@labels[1], call_status)
	end

#	private #how to test this? 

	def make_main_window(ui)
		main = Main_window.new(ui, "Dial Pad", 300,	300)
		@main_window = main.mw
		@mvbox = main.mvbox
	end

	def make_input(ui, call)
		@entry_comp = Entry.new(ui, @mvbox)
		@entry = @entry_comp.entry
		@display_box = @entry_comp.display_box
		clear_button = @entry_comp.clear_button
		@clear_button = make_button_hash(clear_button, "clear")
		clear_all_button = @entry_comp.clear_all_button
		@clear_all_button = make_button_hash(clear_all_button, "clear")

		entry_change ui, @entry, [ @clear_button, @clear_all_button ]
		@labels = handle_display ui, @display_box, call
		call.set_dial_pad(self)
	end

	def	make_number_pad(ui, call)
		Number_pad.new(ui, @mvbox, @entry, [ @clear_button, @clear_all_button ], @entry_comp, @labels, call)
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
