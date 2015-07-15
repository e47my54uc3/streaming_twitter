require 'stop_words'
module ManipulateText
  include StopWords



  def sanitize_text(sentence)

    sentence
    .split(/[^A-Za-z]/)
    .gsub(/\bRT\b/, '')
    .join(' ')

  end

  def count_valid_words(sentence)

    array_of_strings = sanitize_text(sentence)

    array_of_strings.each do |word|
      if STOP_WORDS.include?(word)
        next
      else
        @@word_count += 1
        arr.inject(@@word_hash) { |h,v| h[v] += 1; h }
      end
    end
   

  end


  def find_top_ten(word_hash)
    # word_hash.group_by{|a| x.count(a)}
   

    # top_count = @@word_hash.values.max

    # @@word_hash.select{|k, v| v == max_value}.keys


  end


end