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
end