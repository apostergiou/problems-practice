# frozen_string_literal: true
# Minimize the value |(A[0] + ... + A[P-1]) - (A[P] + ... + A[N-1])|.
def tape_equil(a)
  sum = a.inject(:+)
  minimum = nil
  p = 0
  sum_left = 0
  sum_right = sum

  while p + 1 < a.size
    sum_left += a[p]
    sum_right -= a[p]
    difference = (sum_left - sum_right).abs
    minimum = difference if !minimum || difference < minimum
    p += 1
  end

  minimum
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 1, tape_equil([3, 1, 2, 4, 3])
  end

  def test_pair
    assert_equal 2, tape_equil([1, -1])
  end

  def test_negative
    assert_equal 1, tape_equil([-3, -1, -2, -4, -3])
  end

  def test_zero
    assert_equal 0, tape_equil([1, 1])
  end
end
