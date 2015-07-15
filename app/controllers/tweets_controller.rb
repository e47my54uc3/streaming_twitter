require 'streaming'
class TweetsController < ApplicationController
  include Streaming
 
  def stream
    @all_tweets = []
    transcribe_5min_tweets(@all_tweets)
    binding.pry
  end
end
