class Button
	attr_reader :button
	def initialize ui, row, entry, content, type
		case type
		when "number"
			create( ui, content.to_s, type )
			append( ui, row )
		when "control"
			create( ui, content.to_s, type )
			append( ui, row )
		end
	end

	def create ui, content, type
		@button = ui.new_button(content)
		if type == "control"
			ui.control_disable(@button)
		end
	end

	def append ui, row
		ui.box_append(row, @button, 1)
	end
end
