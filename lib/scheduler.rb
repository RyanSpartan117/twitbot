require_relative 'twitter_bot_service'
require 'rufus-scheduler'


scheduler = Rufus::Scheduler.new

scheduler.every('15m') do
  calmbot = TwitterBotService.new
  calmbot.search_tweets('@thecalmzone @spartaglobal #speakout', 'recent', 3)
  calmbot.retweet
end

scheduler.join
