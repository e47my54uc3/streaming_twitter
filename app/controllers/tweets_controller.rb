require 'streaming'
require 'manipulate_text'
class TweetsController < ApplicationController
  include Streaming
  include ManipulateText
 
  @@all_tweets = []
  def stream
    write_file('hello')

    read_file

   
    # @@all_tweets = []
    # transcribe_5min_tweets(@@all_tweets)

    # count_words(@@all_tweets)

    # binding.pry
  end
end
