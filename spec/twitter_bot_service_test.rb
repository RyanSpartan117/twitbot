require_relative '../lib/twitter_bot_service'
require_relative './spec_helper'

describe TwitterBotService do
	before(:all) do
		@twitterSearch = TwitterBotService.new
	end
  it 'gets the right amount of the tests back' do
	twitterSearchResults = @twitterSearch.search_tweets('@thecalmzone @spartaglobal', 'recent', 3)    
	expect(twitterSearchResults.length).to eql(3)
  end

  it 'returns an array' do
	twitterSearchResults = @twitterSearch.search_tweets('@thecalmzone @spartaglobal', 'recent', 5)    
	expect(twitterSearchResults).to be_a(Array)
  end

  it 'includes the correct search parameters' do  	
	twitterSearchResults = @twitterSearch.search_tweets('@thecalmzone @spartaglobal', 'recent', 5)
	expect(twitterSearchResults[0].text.downcase).to include("@spartaglobal")
	expect(twitterSearchResults[0].text.downcase).to include("@thecalmzone")
  end
end