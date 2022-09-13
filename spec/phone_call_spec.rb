require "phone_call"
require "dial_pad"

RSpec.describe Phone_call do
	let(:dial_pad) { instance_double(Dial_pad, { status_changed: "changed" } ) }
	subject{ described_class.new "+61450493936", "+61450503662", 12346 }

	it { is_expected.to have_attributes sender: "+61450493936", receiver: "+61450503662", contact_id: 12346, status: "in queue" }

	it { is_expected.to respond_to :set_status }
	it { is_expected.to respond_to :set_meta_data }
	it { is_expected.to respond_to :set_start_time }
	it { is_expected.to respond_to :set_end_time }

	it { is_expected.to have_attributes call_status: "in queue" }
	it { is_expected.to respond_to :set_call_status }

	it "can set the call status" do
		subject.set_dial_pad dial_pad
		expect(subject.set_call_status("ringing")).to eq "ringing"
	end

	it "call flow ringing -> answered -> ended" do
		subject.set_dial_pad dial_pad
		expect(subject.call_status).to eq "in queue"
		subject.set_call_status "ringing"
		expect(subject.call_status).to eq "ringing"
		subject.set_call_status "answered"
		expect(subject.call_status).to eq "answered"
		subject.set_call_status "ended"
		expect(subject.call_status).to eq "ended"
	end

	it "call flow ringing -> answered -> transfered" do
		subject.set_dial_pad dial_pad
		expect(subject.call_status).to eq "in queue"
		subject.set_call_status "ringing"
		expect(subject.call_status).to eq "ringing"
		subject.set_call_status "answered"
		expect(subject.call_status).to eq "answered"
		subject.set_call_status "transfered"
		expect(subject.call_status).to eq "transfered"
	end

	it "call flow ringing -> answered -> error" do
		subject.set_dial_pad dial_pad
		expect(subject.call_status).to eq "in queue"
		subject.set_call_status "ringing"
		expect(subject.call_status).to eq "ringing"
		expect{ subject.set_call_status "transfered" }.to raise_error "Incorrect next call status"
	end

	it "does not allow changes after a complete call" do
		subject.set_dial_pad dial_pad
		subject.set_call_status "ringing"
		subject.set_call_status "answered"
		subject.set_call_status "ended"
		expect{ subject.set_call_status "answered" }.to raise_error "This call is complete"
	end

	it "call flow ringing -> rejected" do
		subject.set_dial_pad dial_pad
		expect(subject.call_status).to eq "in queue"
		subject.set_call_status "ringing"
		expect(subject.call_status).to eq "ringing"
		subject.set_call_status "rejected"
		expect(subject.call_status).to eq "rejected"
	end

	it "raises an error when the incorrect status is set" do
		subject.set_dial_pad dial_pad
		expect(subject.call_status).to eq "in queue"
		expect{ subject.set_call_status "transfered" }.to raise_error "Incorrect next call status"
		expect{ subject.set_call_status "ended" }.to raise_error "Incorrect next call status"
		subject.set_call_status "ringing"
		subject.set_call_status "answered"
		expect{ subject.set_call_status "ringing" }.to raise_error "Incorrect next call status"
	end
end
