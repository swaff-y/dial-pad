class Contact 
	attr_reader :sender, :receiver, :contact_id, :status, :meta_data, :start_time, :end_time 

	def initialize sender, receiver, contact_id
		@sender = sender
		@receiver = receiver
		@contact_id = contact_id
		@status = set_status "in queue"
		@meta_data = {}
	end

	def set_status status
		if @status == "complete"
			return raise "This process is complete"
		end
		@status = status
		@status
	end

	def set_meta_data key, value
		@meta_data[key] = value
		@meta_data
	end

	def set_start_time
		@start_time = Time.now.to_i
	end

	def set_end_time
		@end_time = Time.now.to_i
	end
end
