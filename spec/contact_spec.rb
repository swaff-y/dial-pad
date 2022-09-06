require 'contact'

RSpec.describe Contact do
	subject{ described_class.new "+61450493936", "+61450503662", 12346 }

	it { is_expected.to have_attributes sender: "+61450493936", receiver: "+61450503662", contact_id: 12346, start_time: nil, end_time: nil  }
	it { is_expected.to respond_to :set_status }
	it { is_expected.to respond_to :set_meta_data }
	it { is_expected.to respond_to :set_start_time }
	it { is_expected.to respond_to :set_end_time }

	it "can set kvps" do 
		expect(subject.meta_data).to be_a Hash
		expect(subject.set_meta_data("white", "monkey") ).to eq "white" => "monkey"
	end
	
	it "can set a start time" do
		expect(subject.set_start_time).to be_a Integer
		expect(subject.start_time).to be_a Integer
		expect(subject.start_time).to_not be_nil
	end

	it "can set an end time" do
		expect(subject.set_end_time).to be_a Integer
		expect(subject.end_time).to be_a Integer
		expect(subject.end_time).to_not be_nil
	end

	it "raises an error when status change is complete" do
		expect(subject.set_status("complete")).to eq "complete"
		expect{ subject.set_status("answer") }.to raise_error "This process is complete"
	end
end
