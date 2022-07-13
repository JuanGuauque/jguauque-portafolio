module SocialTool
	require 'tweetkit'

	def self.twitter_search
		client = Tweetkit::Client.new do |config|
		  config.bearer_token = ENV.fetch("TWITTER_BEARER_TOKEN")
		  config.consumer_key = ENV.fetch("TWITTER_CONSUMER_KEY")
		  config.consumer_secret = ENV.fetch("TWITTER_CONSUMER_SECRET")
	  end
	  client.search("#technology")
	end
end
