class WordPlay
  def self.most_important_sentence(text, key_words)
    lines = text.sentences
    ranked_sentences = lines.sort_by do |line|
      line.words.length - (line.downcase.words - key_words).length
    end

    ranked_sentences.last
  end

  def self.switch_pronouns(text)
    text.gsub(/\b(I am|You are|I|You|Me|Your|My)\b/i) do |pronoun|
      case pronoun.downcase
        when "i"
          "you"
        when "you"
          "me"
        when "me"
          "you"
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