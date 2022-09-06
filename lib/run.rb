require "./lib/phone_call.rb"
#require './lib/contact.rb'
require 'libui'
require "pry"
require "./lib/dial_pad.rb"

call = Phone_call.new "+61450493936", nil, 123456

dial_pad = Dial_pad.new(LibUI, call)

#binding.pry
