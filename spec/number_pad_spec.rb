require "number_pad"

RSpec.describe Number_pad do
	include_context "ui_context"

	subject { described_class.new(ui, main_view_box, entry, clear_button, clear_all_button ) }
	it { is_expected.to respond_to(:create).with(3).arguments }
end
