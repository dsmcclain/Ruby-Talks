class WordPlay
  def self.most_important_sentence(text, key_words)
    lines = text.sentences
    ranked_sentences = lines.sort_by do |line|
      line.words.length - (line.downcase.words - key_words).length
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
puts WordPlay.most_important_sentence(my_string, key_words)
