require 'stop_words'
module ManipulateText
  include StopWords



  def sanitize_text(sentence)

    sentence
    .split(/[^A-Za-z]/)
    .map{|el| el.gsub(/\bRT\b/, '')}
    .join(' ')

  end

  def count_valid_words(sentence)

    array_of_strings = sentence.split(/\s+/)

    array_of_strings.each.with_index do |word, ind|
      if STOP_WORDS.include?(word)
        next
      else
        $word_count += 1
        $word_hash[word] += 1
        binding.pry
      end
    end
   

  end


  def find_top_ten(word_hash)
    # word_hash.group_by{|a| x.count(a)}
   

    # top_count = @@word_hash.values.max

    # @@word_hash.select{|k, v| v == max_value}.keys


  end


end