require "./lib/contact.rb"

class Phone_call < Contact
	attr_reader :call_status

	def initialize sender, receiver, contact_id
		super(sender, receiver, contact_id)
		@call_status = "in queue"
	end

	def set_call_status next_status
		if @status == "complete" 
			return raise "This call is complete"
		end
		call_status = ""
		contact_status = ""
		error_msg = "Incorrect next call status"
		case @call_status
		when "in queue"
			case next_status
			when "ringing"
				call_status = "ringing"
				contact_status = "pre-contact"
			else
				raise error_msg 
			end
		when "ringing"
			case next_status
			when "answered"
				call_status = "answered"
				contact_status = "in progress"
				set_start_time
			when "rejected"
				call_status = "rejected"
				contact_status = "complete"
				set_start_time
				set_end_time
			else
				raise error_msg 
			end
		when "answered"
			case next_status
			when "transfered"
				call_status = "transfered"
				contact_status = "complete"
				set_end_time
			when "ended"
				call_status = "ended"
				contact_status = "complete"
				set_end_time
			else
				raise error_msg
			end
		end
		@status = contact_status
		@call_status = call_status
	end
end
