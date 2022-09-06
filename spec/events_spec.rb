require "events"
require "context_spec"

RSpec.describe Events do

	context "click events" do
		include_context "ui_context"
		it "Responds to number click with arguments" do 
			expect(Events).to respond_to(:number_entry_click).with(5).arguments 
		end
	
		it "returns 'enabled' if text is present" do
			expect(Events.number_entry_click(ui, entry, "content", clear_button, clear_all_button)).to eq "enabled"
		end
	
		it "returns 'disabled' if text is not present" do
			expect(Events.number_entry_click(ui2, entry, "content", clear_button, clear_all_button)).to eq "disabled"
		end
	end

	context "change events" do
		include_context "ui_context"
		it "Responds to entry change with arguments" do 
			expect(Events).to respond_to(:entry_change).with(4).arguments 
		end
	
		it "returns 'enabled' if text is present" do
			expect(Events.entry_change(ui, entry,clear_button, clear_all_button)).to eq "enabled"
		end
	
		it "returns 'disabled' if text is not present" do
			expect(Events.entry_change(ui2, entry, clear_button, clear_all_button)).to eq "disabled"
		end
	end

	context "clear_all_click" do
		include_context "ui_context"
		it "clears all the numbers from the entry" do 
			expect(Events).to respond_to(:clear_all_click).with(2).arguments 
			expect(Events.clear_all_click(ui, entry)).to eq true
		end
	end

	context "clear_click" do
		include_context "ui_context"
		it "clears the last number from the entry" do 
			expect(Events).to respond_to(:clear_click).with(2).arguments 
			expect(Events.clear_click(ui, entry)).to eq true
		end
	end
end
