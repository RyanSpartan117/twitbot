 require 'twitter'
require 'yaml'

class TwitterBotService

  attr_accessor :tweets, :searchArray

  def initialize
    env_var = YAML.load_file('data/env.yml')
    @twitter_client = Twitter::REST::Client.new do |config|
      config.consumer_key = env_var['consumer_key']
      config.consumer_secret = env_var['consumer_secret']
      config.access_token =  env_var['access_token']
      config.access_token_secret = env_var['access_token_secret']
    end

    searchArrayFile = YAML.load_file('data/search.yml')
    @searchArray = searchArrayFile['searchHashTags']

    @tweets = []
  end

  # provide query string to search for - result types str are -> recent, popular or mixed finally total number of
  # responses to be returned
  def search_tweets(result_type, number_of_responses)
    
    searchORstring = @searchArray.map { |hashtagElement| hashtagElement.to_s + " OR"}.join(" ")
    search = @twitter_client.search(searchORstring, result_type: result_type).take(number_of_responses)

    if search.empty? == false
      search.each do |tweet|
        @tweets << tweet
      end
    else
      raise('Your search returned no tweets')
    end
    @tweets
  end

  def get_available_hashtags(tweetText)
    tweetTextDowncased = tweetText.downcase
    hashtagsToUse = ["#malementalhealth", "#itsokaynottobeokay", "#stopthestigma", "#letstalkaboutit", "#mentalhealth", "#life", "#menshealth", "#support", "#modernmasculinity", "#motivation"]

    tweetTextHashTags = []
    tweetTextDowncased.gsub(/#[\S]+/) {|matchHash| tweetTextHashTags << matchHash}
    hashtagsToUse - tweetTextHashTags

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
    tweet.user.screen_name
    tweetUrl = "https://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id}"

    @twitter_client.update("#{status} #{tweetUrl}")
  end

  def autogenerate_status_quote(tweet)
    
    hashtags = get_available_hashtags(tweet.text)
    pickHashtags = hashtags.sample(4)
    status = pickHashtags.map { |i| i.to_s}.join(" ")

    screenName = tweet.user.screen_name
    tweetUrl = "https://twitter.com/#{screenName}/status/#{tweet.id}"

    @twitter_client.update("@#{screenName} #{status} #{tweetUrl}")
  end
end