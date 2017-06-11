# frozen_string_literal: true
# Check whether array A is a permutation.
def perm_check(a)
  seen = {}

  a.each do |item|
    return 0 if item > a.size
    seen[item] = true
  end

  seen.size == a.size ? 1 : 0
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 1, perm_check([4, 1, 3, 2])
  end

  def test_one
    assert_equal 1, perm_check([1])
  end

  def test_one_bad
    assert_equal 0, perm_check([6])
  end

  def test_bad
    assert_equal 0, perm_check([4, 1, 3])
  end
end
