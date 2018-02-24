require_relative 'lib/twitter_bot_service'


twitterBot = TwitterBotService.new
twitterBotResults = twitterBot.search_tweets('@thecalmzone @spartaglobal', 'recent', 3)
# twitterBot.reply_to_tweet("@spartaglobal #SpeakOut4MentalHealth, #SpeakOutForMentalHealth", twitterBotResults[0])
twitterBot.quote_tweet("@spartaglobal #SpeakOut4MentalHealth, #SpeakOutForMentalHealth", twitterBotResults[0])
# twitterBot.print_tweets