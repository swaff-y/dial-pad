require "dial_pad"
require "libui"
require "context_spec"

RSpec.describe Dial_pad do
	include_context "ui_context"
 	subject{ described_class.new(ui, call) }

 	it{ is_expected.to respond_to(:status_changed).with(1).arguments 		}
 	it{ is_expected.to respond_to(:make_main_window).with(1).arguments 		}
 	it{ is_expected.to respond_to(:make_input).with(2).arguments 			}
 	it{ is_expected.to respond_to(:make_number_pad).with(2).arguments 		}
 	it{ is_expected.to respond_to(:handle_closing).with(1).arguments 		}
 	it{ is_expected.to respond_to(:handle_control_show).with(1).arguments 	}
 	it{ is_expected.to respond_to(:handle_main_and_quit).with(1).arguments 	}
end
