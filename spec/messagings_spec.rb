require 'spec_helper'

describe Sendbird::Messaging do

  describe "#create" do

  	let(:messaging) 			{ Sendbird::Messaging.new(name: "Groupe 1") }

  	context "valid api token" do
	    before(:each) do
	      VCR.use_cassette "messaging_create" do
	      	@created_messaging = messaging.create
	      end
	    end

	    it { expect(@created_messaging).to be_persisted }
	    it { expect(@created_messaging.channel_url).to eq("jiver_group_messaging_AFD73870-2585-41C9-8E7F-D2A494BEC71A_e1ba77cca364b3d48cc6744550ea798113cf285c") }

  	end

  end

  describe "#invite" do

  	let(:messaging) 		{ Sendbird::Messaging.new(name: "Groupe 1") }
  	let(:user) 					{ Sendbird::User.new(id: "user_12345", nickname: "Etienne") }

  	context "valid api token" do
	    before(:each) do
	    	VCR.use_cassette "messaging_create" do
	      	@created_messaging = messaging.create
	      end

	      VCR.use_cassette "user_create" do
	      	@created_user = user.create
	      end

	      VCR.use_cassette "messaging_invite" do
	      	@created_messaging.invite(@created_user)
	      end

	      VCR.use_cassette "messaging_view" do
	      	@messaging_with_members = @created_messaging.view
	      end
	    end

	    it { expect(@messaging_with_members.members.size).to eq(1) }

  	end

  end

end