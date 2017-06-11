# frozen_string_literal: true
# Find longest sequence of zeros in binary representation of an integer.
def binary_gap(n)
  zeroes = n.to_s(2).split('1')
  zeroes.pop if n % 2 == 0

  return 0 if zeroes.empty?
  zeroes.map { |zeroes| zeroes.length }.max
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 5, binary_gap(1041)
  end

  def test_zero_at_the_end
    assert_equal 1, binary_gap(20)
  end

  def test_minimum
    assert_equal 0, binary_gap(1)
  end
end
