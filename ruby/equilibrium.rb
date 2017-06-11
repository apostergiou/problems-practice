# frozen_string_literal: true
# Find an index in an array such that its prefix sum equals its suffix sum.
def equilibrium(a)
  left = 0
  right = a.reduce :+

  a.length.times do |index|
    left += a[index - 1] if index > 0
    right -= a[index]
    return index if left == right
  end

  -1
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_no_element
    assert_equal(-1, equilibrium([]))
  end

  def test_one_element
    assert_equal 0, equilibrium([10])
  end

  def test_example_input
    assert_equal 3, equilibrium([-7, 1, 5, 2, -4, 3, 0])
  end
end
