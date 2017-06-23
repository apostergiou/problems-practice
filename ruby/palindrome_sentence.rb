##
# Given a sentence, return true if the sentence is a palindrome.
def palindrome?(sentence)
  sentence = sentence.split.map(&:downcase).join
  words = sentence.split
  reversed_words = words.reverse.map(&:reverse)
  reversed_sentence = reversed_words.join

  sentence == reversed_sentence
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input_1
    assert_equal true, palindrome?('Race fast safe car')
  end

  def test_example_input_2
    assert_equal true, palindrome?('Live not on Evil')
  end

  def test_example_input_3
    assert_equal false, palindrome?('foo')
  end
end
