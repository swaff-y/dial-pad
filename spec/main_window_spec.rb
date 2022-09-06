require "LibUI"
require "main_window"
require "context_spec"

RSpec.describe Main_window do
	include_context "ui_context"

	subject{ described_class.new( ui, "Dail Pad", 400, 400 ) }

	it{ is_expected.to respond_to(:main_window).with(4).arguments }
	it{ is_expected.to respond_to(:window_box).with(1).arguments }
	it{ is_expected.to respond_to(:create).with(1).arguments }
end
