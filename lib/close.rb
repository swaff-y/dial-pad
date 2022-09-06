class Closer
	def self.create ui, main_window
		ui.window_on_closing(main_window) do
			create_event(ui, main_window)
		end
	end

	def self.create_event ui, main_window
  			puts 'Bye Bye'
  			ui.control_destroy(main_window)
  			ui.quit
  			0
	end
end
