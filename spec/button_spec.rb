require "button"
require "LibUI"
require "./lib/phone_call.rb"
require "context_spec"

RSpec.describe Button do
	include_context "ui_context"
 	subject{ described_class.new( ui, row, entry, "1", "number" ) }

 	it{	is_expected.to respond_to(:create).with(3).arguments }	
 	it{	is_expected.to respond_to(:append).with(2).arguments }	
end
