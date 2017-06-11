# frozen_string_literal: true
def swap_sort(a)
  sorted = a.sort
  swaps = 0

  a.each_with_index do |val, i|
    swaps += 1 unless sorted[i] == val
  end

  swaps <= 2 ? true : false
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal true, swap_sort([1, 3, 5])
  end

  def test_example_input_2
    assert_equal true, swap_sort([1, 5, 3, 3, 7])
  end

  def test_example_input_3
    assert_equal false, swap_sort([1, 5, 3, 2, 3, 7])
  end

  def test_example_input_4
    assert_equal true, swap_sort([1, 1, 1])
  end

  def test_example_input_5
    assert_equal true, swap_sort([1])
  end
end
