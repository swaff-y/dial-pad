require "events"
require "context_spec"

RSpec.describe Events do

	context "click events" do
		include Events
		include_context "ui_context"
	
		it "responds to number click events" do
			expect(number_entry_click(ui, entry, "content",  buttons)).to eq true
		end
	end

	context "make button hash" do
		include Events
		include_context "ui_context"

		it "makes a hash" do
			expect(make_button_hash("button", "type")).to eq :button => "button", :type => "type" 
		end
	end

	context "handle display" do
		include Events
		include_context "ui_context"

		it "handles the display" do
			expect(handle_display(ui, "display_box", call)).to eq [ "new_label", "new_label" ] 
		end
	end

	context "control change" do
		include Events
		include_context "ui_context"
	
		it "enables a clear button control when text length > 0" do
			expect(control_change(ui, "text", ui.new_button, "clear")).to eq "enabled"
		end
		it "disables a clear button control when text length == 0" do
			expect(control_change(ui, "", ui.new_button, "clear")).to eq "disabled"
		end
		it "enables a call button control when text length > 9" do
			expect(control_change(ui, "textwithmorecharacters", ui.new_button, "call")).to eq "enabled"
		end
		it "disables a call button control when text length == 0" do
			expect(control_change(ui, "", ui.new_button, "call")).to eq "disabled"
		end
	end

	context "change events" do
		include Events
		include_context "ui_context"
	
		it "responds to entry change" do
			expect(entry_change(ui, entry, buttons)).to eq true
		end
	end

	context "clear_all_click" do
		include Events
		include_context "ui_context"
		it "clears all the numbers from the entry" do 
			expect(clear_all_click(ui, entry, buttons)).to eq true
		end
	end

	context "clear_click" do
		include Events
		include_context "ui_context"
		it "clears the last number from the entry" do 
			expect(clear_click(ui, entry, buttons)).to eq true
		end
	end

	context "call_click" do
		include Events
		include_context "ui_context"
		it "adds the dialed number to the display" do 
			expect(handle_call_click(ui, call_button, entry, labels)).to eq true
		end
	end

end
