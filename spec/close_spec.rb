require "close"
require "LibUI"
require "context_spec"

RSpec.describe Closer do
	include_context "ui_context"

 	subject{ described_class }
 	it{ is_expected.to respond_to(:create_event).with(2).arguments 	}
 	it{ is_expected.to respond_to(:create).with(2).arguments 	}

	it "responds to a close event" do
		expect(subject.create_event(ui, "window")).to eq 0
	end
end
