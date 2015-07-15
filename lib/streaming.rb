module Streaming
  def transcribe_5min_tweets(holder)
    t = Time.now
   
    TweetStream::Client.new.sample do |status|
      minutes = (status.created_at - t).to_i / 60

      if minutes < 1 #will grab streams for up to 5 minutes
        puts "#{status.text}"
        holder << status.text

        write_file(status.text)

        puts minutes
      else
        return
      end
    end

  end

  def write_file(string)
    tweet_text_path = File.join( File.dirname(__FILE__), '../public/all_tweets.txt' ) #relative to module location
    File.write(tweet_text_path, string)
  end

  def read_file
    tweet_text_path = File.join( File.dirname(__FILE__), '../public/all_tweets.txt' )
    File.open(tweet_text_path).readlines.each do |line|
       puts line
    end
  end


end