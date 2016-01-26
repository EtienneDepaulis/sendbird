module Sendbird
  class Configuration
    attr_accessor :site, :api_key

    def initialize
      @site = "https://api.sendbird.com/"
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end
end