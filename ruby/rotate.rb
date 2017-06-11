# frozen_string_literal: true
# Rotate an array to the right by a given number of steps.
def rotate(a, k)
  a.rotate(-k)
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal [9, 7, 6, 3, 8], rotate([3, 8, 9, 7, 6], 3)
  end

  def test_empty_array
    assert_equal [], rotate([], 5)
  end

  def test_zero_rotations
    assert_equal [1, 2, 3], rotate([1, 2, 3], 0)
  end
end
