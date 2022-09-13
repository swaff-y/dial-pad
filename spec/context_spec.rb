require "LibUI"
require "phone_call"
require "entry"

RSpec.shared_context "ui_context" do
	meths = {
		new_button: 		"button", 
		box_append: 		"box", 
		new_vertical_box: 	"box",
		button_on_clicked:	"button_click",
		entry_text: 		"entry",
		control_enable: 	"enable",
		control_disable: 	"disable",
		new_button: 		"button",
		entry_text: 		"entry",
		new_entry:			"entry",
		new_horizontal_box: "hbox",
		box_set_padded: 	"padded",
		entry_set_text: 	"set_text",
		control_destroy: 	"destroy",
		quit: 				"quit",
		new_window: 		"new_window",
		window_set_child:	"set_child",
		entry_on_changed:	"changed",
		init:				"init",
		window_on_closing:	"window_on_closing",
		control_show:		"show",
		main:				"main",
		new_label:			"new_label",
		label_set_text:		"label_set_text"
	}
	let(:ui) { class_double(LibUI, meths).as_stubbed_const }
	let(:ui2) do 
		meths[:entry_text] = ""
		class_double(LibUI, meths).as_stubbed_const 
	end	
	let(:call) do
		call_meths = {
			call_status:	"in queue",
			set_dial_pad:	"dial_pad"
		}
		instance_double(Phone_call, call_meths) 
	end
	let(:entry_comp) do
		call_meths = {
			set_clear_clickers:	"clear_clickers"
		}
		instance_double(Entry, call_meths) 
	end


	let(:row) 				{ ui.new_vertical_box 					}
	let(:entry) 			{ ui.new_entry 							}
	let(:pad) 				{ ui.new_horizontal_box 				}
	let(:clear_button)		{ ui.new_button 						}
	let(:clear_all_button)	{ ui.new_button 						}
	let(:call_button)		{ ui.new_button 						}
	let(:end_button)		{ ui.new_button 						}
	let(:main_view_box)		{ ui.new_vertical_box 					}
	let(:mvbox)				{ ui.new_vertical_box 					}
	let(:buttons)			{ [ 
		{ 
			button: clear_button, 
			type: "clear" 
		}, 
		{ 
			button: clear_all_button, 
			type: "clear" 
		}, 
		{ 
			button: call_button, 
			type: "call" 
		},
		{ 
			button: end_button, 
			type: "end" 
		}
	]}
	let(:labels)			{ [ ui.new_label, ui.new_label ] }
end
