class WordPlay
  def self.most_important_sentence(sentences, key_words)
    ranked_sentences = sentences.sort_by do |s|
      s.words.length - (s.downcase.words - key_words).length
    end

    ranked_sentences.last
  end
end

#splits on a period followed by whitespace. 
# TODO: add other sentence-ending punctuation. Or even newlines.
class String
  def sentences
    gsub(/\n|\r/, ' ').split(/\.\s*/)
  end

  def words
    scan(/\w[\w\'\-]*/)
  end
end

my_string = "Brexit is a total disaster. They can't seem to agree on anything.  If the UK leaves the EU, it will be a failure."
key_words = %w{brexit, uk, eu}
puts WordPlay.most_important_sentence(my_string.sentences, key_words)
