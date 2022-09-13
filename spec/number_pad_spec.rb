require "number_pad"
require "context_spec"

RSpec.describe Number_pad do
	include_context "ui_context"

	subject { described_class.new(ui, main_view_box, entry, buttons, entry_comp, labels ) }
	it { is_expected.to respond_to(:create).with(3).arguments }
end
