# frozen_string_literal: true
# Find value that occurs in odd number of elements.
def odd_occurrences(a)
  a.reduce(:^)
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 7, odd_occurrences([9, 3, 9, 7, 3])
  end

  def test_single_item
    assert_equal 42, odd_occurrences([42])
  end
end
