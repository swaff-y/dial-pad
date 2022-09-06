require "button_row"
require "context_spec"

RSpec.describe Button_row do
	include_context "ui_context"

	subject { described_class.new(ui, pad, entry, 1) }
	it { is_expected.to respond_to(:create).with(4).arguments }
end
