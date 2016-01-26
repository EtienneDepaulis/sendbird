require 'bundler/setup'
require 'webmock/rspec'
require 'vcr'

require_relative '../lib/sendbird.rb'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = false
  c.before_record do |i|
    i.response.body.force_encoding('UTF-8')
  end
end

RSpec.configure do |c|
  c.before(:each) do
  	Sendbird.configure do |config|
			config.api_key = "9d2e4c2d8a295ef883f5444775781c5bf59527d7"
		end
  end
end