require 'streaming'
require 'manipulate_text'
class TweetsController < ApplicationController
  include Streaming
  include ManipulateText
 
  $all_tweets = []
  $word_count = 0
  $word_hash = Hash.new(0)

  def stream
    # ignore_stop_words("")

    append_file(Time.now.to_s)
    # @@all_tweets = []
    transcribe_5min_tweets

    append_file(Time.now.to_s)

    # count_words(@@all_tweets)

    binding.pry

    redirect_to :controller => 'tweets', :action => 'sanitize'
  end


  def sanitize
    read_file

    $all_tweets = $all_tweets.join

    count_valid_words($all_tweets)


    binding.pry

    formatted_file

  end
end
