class WordPlay
  def self.most_important_sentence(text, key_words)
    lines = text.sentences
    ranked_sentences = lines.sort_by do |line|
      line.words.length - (line.downcase.words - key_words).length
    end

    ranked_sentences.last
  end

  def self.switch_pronouns(text)
    text.gsub(/\b(I am|You are|I|You|Your|My)\b/i) do |pronoun|
      case pronoun.downcase
        when "i"
          "you"
        when "you"
          "me"
        when "i am"
          "you are"
        when "you are"
          "i am"
        when "your"
          "my"
        when "my"
          "your"
      end
    end.sub(/^me\b/i, 'i')
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

puts WordPlay.switch_pronouns("Your cat is not a creature I like.")
puts WordPlay.switch_pronouns("You think it is time for me to go")