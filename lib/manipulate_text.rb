require 'stop_words'
module ManipulateText
  include StopWords



  def sanitize_text(sentence)

    sentence
    .downcase
    .split(/[^A-Za-z]/)
    .map{|el| el.gsub(/\brt\b/, '')}
    .join(' ') +'.'

  end

  def count_valid_words(sentence)

    array_of_strings = sentence.split(/[.|\s+]/)


    array_of_strings.each.with_index do |word, ind|
      if STOP_WORDS.include?(word)
        next
      else
        $word_count += 1
        $word_hash[word] += 1
      end
    end
   

  end


  def find_top_ten
    most_common = []
    string = ""
    most_common = $word_hash.sort_by{|k, v| v}[-10..-1].reverse

    return most_common

  end


end