module Streaming
  def transcribe_5min_tweets
    t = Time.now
   
    TweetStream::Client.new.sample do |status|
      minutes = (status.created_at - t).to_i / 60

      if minutes < 5 #will grab streams for up to 5 minutes

        puts "#{status.text}"

        append_file(status.text)

        puts minutes
      else
        return
      end
    end

  end

  def append_file(string)
    tweet_text_path = File.join( File.dirname(__FILE__), '../public/all_tweets.txt' ) #relative to module location
    # File.write(tweet_text_path, string)

    open(tweet_text_path, 'a') do |f|
      f.puts string
    end

  end

  def formatted_file

      tweet_text_path = File.join( File.dirname(__FILE__), '../public/analyzed_tweets.txt' ) #relative to module location
      open(tweet_text_path, 'a') do |f|
        f.puts sentence
      end


      open(tweet_text_path, 'a') do |f|
        f.puts "#{$word_count} words counted"
      end
  end

  def read_file
    tweet_text_path = File.join( File.dirname(__FILE__), '../public/all_tweets.txt' )
    File.open(tweet_text_path).readlines.each do |line|

      puts sanitize_text(line)
       $all_tweets << (sanitize_text(line))
    end
  end


end