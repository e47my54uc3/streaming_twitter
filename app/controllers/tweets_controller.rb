require 'streaming'
require 'manipulate_text'
class TweetsController < ApplicationController
  include Streaming
  include ManipulateText
 
  $all_tweets = []
  $word_count = 0
  $word_hash = Hash.new(0)

  def stream #only ran one time

    append_file(Time.now.to_s)

    transcribe_5min_tweets

    append_file(Time.now.to_s)

    redirect_to :controller => 'tweets', :action => 'sanitize'
  end


  def sanitize
    read_file

    $all_tweets = $all_tweets.join(' ')

    count_valid_words($all_tweets)

    formatted_file($all_tweets)

    render :json => {most_common_words: find_top_ten, total_words_analyzed: $word_count}
  end
end
