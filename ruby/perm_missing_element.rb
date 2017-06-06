# Find the missing element in a given permutation.
def perm_missing_element(a)
  n = a.size
  expected_sum = (1..n).reduce(0, :+)
  actual_sum = a.reduce(0, :+) - n - 1

  expected_sum - actual_sum
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 4, perm_missing_element([2, 3, 1, 5])
  end

  def test_empty_array
    assert_equal 1, perm_missing_element([])
  end

  def test_one_element
    assert_equal 1, perm_missing_element([2])
  end
end
