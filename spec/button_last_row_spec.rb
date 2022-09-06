require "button_last_row"
require "context_spec"

RSpec.describe Button_last_row do
	include_context "ui_context"
	subject { described_class.new(ui, pad, entry) }

	it { is_expected.to respond_to(:create).with(3).arguments }
end
