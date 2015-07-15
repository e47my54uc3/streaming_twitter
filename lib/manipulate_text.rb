module ManipulateText



  def count_words(full_tweet_set)
    count = 0
    full_tweet_set.each do |tweet|
      count += tweet.split(/\W+/).length
    end
    p count
  end

  def ignore_stop_words(array)
    

  end


  def find_top_ten(array)


  end


end