# CALM Twitter Bot

This project is a simple implementation of a ruby Twitter Bot which is scheduled using the Rufus Scheduler Gem.

The bot finds twitter posts containing the following keywords: @SpartaGlobal, @thecalmzone, #SpeakOutForMentalHealth, #SpeakOut4MentalHealth, #TheCalmZone. For each post found, the bot tweets the found posts as quotes and includes in those tweets a comment made up of 4 #hashtags from a set list of #hashtags.


# Getting Started

## Prerequisites

Ruby - https://www.ruby-lang.org/en/downloads/
Git - https://git-scm.com/downloads 
Text Editor
Terminal / IDE of your choice

## Installing

Download and install Ruby.
Once installed, add the bin folder from the Ruby folder to your Path variable if it hasn’t been done already.
Download and install git.
Once installed, add the bin folder from the Git folder to your Path variable if it hasn’t been done already.
Clone the repo.
Once cloned, run bundle install in the command line to install the bundler.
In command line run gem install twitter to install the twitter gem.

## Running the tests

From the root directory, use the following command to run the tests: `rspec`
If this doesn’t work, use rspec on the file that you want to test when in the root directory 
e.g. `rspec spec/twitter_bot_service_test.rb`

## Deployment
<<todo>>

## Contributing
<<todo>>

## Versioning
<<todo>>

## Authors

## License
<<todo>>

## Acknowledgements

- CALM
- IG Group
- SpartaGlobal


  