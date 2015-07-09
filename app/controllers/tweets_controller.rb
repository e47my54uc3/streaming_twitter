class TweetsController < ApplicationController
  def stream

    t = Time.now


    
    TweetStream::Client.new.sample do |status|
      minutes = (status.created_at - t).to_i / 60

      # The status object is a special Hash with
      # method access to its keys.
      if minutes <= 5
        puts "#{status.text}"
        puts minutes
      end
      # binding.pry
    end
  end
end
