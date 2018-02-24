require_relative '../lib/twitter_bot_service'
require_relative './spec_helper'

describe TwitterBotService do
	before(:all) do
		@twitterSearch = TwitterBotService.new
	end
	it 'gets the right amount of the tests back' do
		twitterSearchResults = @twitterSearch.search_tweets('recent', 3)    
		expect(twitterSearchResults.length).to eql(3)
	end

	it 'returns an array' do
		twitterSearchResults = @twitterSearch.search_tweets('recent', 5)    
		expect(twitterSearchResults).to be_a(Array)
	end

	it 'the get available hashtags method shouldnt include anything in the argument string' do
		testString = "this is a test tweet for mental health #mentalhealth"
		checkMethod = @twitterSearch.get_available_hashtags(testString)
		expect(checkMethod).not_to include("#mentalhealth")
	end

	it 'the get available hashtags method shouldnt include multiple hashtags in the argument string' do
		testString = "this is a test tweet for mental health #mentalhealth #cup #life"
		checkMethod = @twitterSearch.get_available_hashtags(testString)
		expect(checkMethod).not_to include("#mentalhealth")
		expect(checkMethod).not_to include("#Life")
	end

	it 'should include MaleMentalHealth' do
		testString = "this is a test tweet for mental health #mentalhealth #cup"
		checkMethod = @twitterSearch.get_available_hashtags(testString)
		expect(checkMethod).to include("#malementalhealth")
	end

end