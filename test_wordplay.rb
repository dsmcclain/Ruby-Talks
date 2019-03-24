require 'minitest/autorun'
require_relative 'wordplay'

class TestWordPlay < Minitest::Test
  def test_sentences
    assert_equal(["a", "b", "c d", "e f g"], "a. b. c d. e f g.".sentences)

    test_text = %q{Hello. This is a test
of sentence separation. This is the end
of the test.}
    assert_equal("This is the end of the test", test_text.sentences[2])
  end

  def test_words
    assert_equal(["a", "b", "cde", "fg"], "a b cde. fg.".words)
    assert_equal(%w{these are all just words}, "these, are. all. just words,".words)
  end

  def test_most_important_sentence
    assert_equal('This is a great test',
                  WordPlay.most_important_sentence(
                    'This is a test. This is a second test. This is a great test', %w{test great this} ))
    assert_equal('This is still a great test',
                  WordPlay.most_important_sentence(
                    'This is still a great test', %w{foo bar baz} ))
  end

  def test_basic_pronun_switches
    assert_equal("i am a robot", WordPlay.switch_pronouns("you are a robot"))
    assert_equal("you are a person", WordPlay.switch_pronouns("i am a person"))
    assert_equal("i love you", WordPlay.switch_pronouns("you love me"))
  end
  
  def test_mixed_pronouns
    assert_equal("you gave me life", WordPlay.switch_pronouns("i gave you life"))
    assert_equal("i am not what you are", WordPlay.switch_pronouns("you are not what i am"))
    assert_equal("i annoy your dog with my antics", WordPlay.switch_pronouns("you annoy my dog with your antics"))
  end
end