module Streaming
  def transcribe_5min_tweets(holder)
    t = Time.now
   
    TweetStream::Client.new.sample do |status|
      minutes = (status.created_at - t).to_i / 60

      if minutes < 1 #will grab streams for up to 5 minutes
        puts "#{status.text}"
        holder << status.text
        puts minutes
      else
        return
      end
    end

  end


end