require_relative 'lib/twitter_bot_service'


twitterBot = TwitterBotService.new
twitterBotResults = twitterBot.search_tweets('@thecalmzone @spartaglobal', 'recent', 3)
# twitterBot.quote_tweet("@spartaglobal #SpeakOut4MentalHealth, #SpeakOutForMentalHealth", twitterBotResults[0])

twitterBot.autogenerate_status_quote(twitterBotResults[0])