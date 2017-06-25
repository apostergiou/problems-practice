#
## Find if a given number is a Kaprekar number.
def kaprekar?(k)
  n = k.to_s.size
  square = (k ** 2).to_s

  second_half = square[-n..-1]
  first_half = square.size.even? ? square[0..n-1] : square[0..n-2]

  k == first_half.to_i + second_half.to_i
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input_1
    assert_equal true, kaprekar?(9)
  end

  def test_example_input_2
    assert_equal true, kaprekar?(297)
  end

  def test_example_input_3
    assert_equal false, kaprekar?(200)
  end
end
