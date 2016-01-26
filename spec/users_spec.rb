require 'spec_helper'

describe Sendbird::User do

  describe "#create" do

  	let(:user) { Sendbird::User.new(id: "user_12345", nickname: "Etienne") }

  	context "valid api token" do
	    before(:each) do
	      VCR.use_cassette "user_create" do
	      	@created_user = user.create
	      end
	    end

	    it { expect(@created_user).to be_persisted }
	    it { expect(@created_user.user_id).to eq("4510356") }

  	end

  	context 'invalid attributes' do

  		let(:user) { Sendbird::User.new }

  		it 'raises an error' do
  			expect {
  				VCR.use_cassette "user_create_invalid_attributes" do
		      	@created_user = user.create
		      end
		    }.to raise_error Sendbird::Error
  	end

  	end



  end

end