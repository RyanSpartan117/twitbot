 require 'twitter'
require 'yaml'

class TwitterBotService

  attr_accessor :tweets

  def initialize
    env_var = YAML.load_file('data/env.yml')
    @twitter_client = Twitter::REST::Client.new do |config|
      config.consumer_key = env_var['consumer_key']
      config.consumer_secret = env_var['consumer_secret']
      config.access_token =  env_var['access_token']
      config.access_token_secret = env_var['access_token_secret']
    end
    @tweets = []
  end

  # provide query string to search for - result types str are -> recent, popular or mixed finally total number of
  # responses to be returned
  def search_tweets(search_query_string, result_type, number_of_responses)
    search = @twitter_client.search(search_query_string, result_type: result_type).take(number_of_responses)

    if search.empty? == false
      search.each do |tweet|
        @tweets << tweet
      end
    else
      raise('Your search returned no tweets')
    end
    @tweets
  end

  def print_tweets
    @tweets.each do |tweet|
      p tweet.text
    end
  end

  def retweet
    @tweets.each do |tweet|
      begin
      @twitter_client.retweet!(tweet)
      rescue Twitter::Error::Forbidden
      end
    end
  end

  def reply_to_tweet(status, tweet)

    options = {
      :in_reply_to_status_id => tweet.id
    }

    @twitter_client.update(status, options)
  end

  def quote_tweet(status, tweet)
    
    tweetUrl = "https://twitter.com/i/web/status/#{tweet.id}"

    @twitter_client.update("#{status} #{tweetUrl}")

  end
end