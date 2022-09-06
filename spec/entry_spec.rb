require "entry"
require "context_spec"

RSpec.describe Entry do
	include_context "ui_context"
	subject { described_class.new(ui, mvbox) }

	it { is_expected.to respond_to(:create).with(2).arguments }
	it { is_expected.to respond_to(:append).with(2).arguments }
	it { is_expected.to respond_to(:change).with(1).arguments }
end
