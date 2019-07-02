# frozen_string_literal: true

# Social Tool
module SocialTool
  def self.twitter_search
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV.fetch('CONSUMER_API_KEY')
      config.consumer_secret     = ENV.fetch('CONSUMER_API_SECRET_KEY')
      config.access_token        = ENV.fetch('ACCESS_TOKEN')
      config.access_token_secret = ENV.fetch('ACCESS_TOKEN_SECRET')
    end

    client.search('#rails', result_type: 'recent').take(6).collect do |tweet|
      "<b>#{tweet.user.screen_name}</b> #{tweet.text}".html_safe
    end
  end
end
