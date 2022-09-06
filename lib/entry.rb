require "./lib/button.rb"
require "./lib/events.rb"

class Entry
	attr_reader :entry, :clear_button, :clear_all_button, :display_box

	def initialize(ui, main_view_box)
		create(ui, main_view_box)
		append(ui, main_view_box)
		change(ui)
	end

	def create(ui, main_view_box)
		@thbox = ui.new_vertical_box
		@display_box = ui.new_horizontal_box
		@twobox = ui.new_vertical_box
		@twoonebox = ui.new_horizontal_box
		@twotwobox = ui.new_horizontal_box
		ui.box_set_padded(@twotwobox, 1)
		@entry = ui.new_entry
		clear = Button.new ui, @twotwobox, nil, "Clear", "control"
		@clear_button = clear.button
		clear_all = Button.new ui, @twotwobox, nil, "Clear All", "control"
		@clear_all_button = clear_all.button

		ui.control_disable(@clear_button)
		ui.control_disable(@clear_all_button)

		ui.button_on_clicked(@clear_all_button) do
			Events.clear_all_click(ui, entry)
		end
		ui.button_on_clicked(@clear_button) do
			Events.clear_click(ui, entry)
		end
	end

	def append(ui, main_view_box)
		ui.box_append(@thbox, @display_box, 1)
		ui.box_append(@thbox, @twobox, 1)
		ui.box_append(@twobox, @twoonebox, 1)
		ui.box_append(@twobox, @twotwobox, 1)
		ui.box_append(@twoonebox, @entry, 1)
		ui.box_append(main_view_box, @thbox, 1)
	end

	def change(ui)
		ui.entry_on_changed(@entry) do
			Events.entry_change(ui, @entry, @clear_button, @clear_all_button)
		end
	end
end
