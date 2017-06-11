# frozen_string_literal: true
# Find the earliest time when a frog can jump to the other side of a river.
def frog_river_one(x, a)
  leafs = Array.new(x, nil)

  a.each_with_index do |leaf, i|
    if leafs[leaf - 1].nil?
      leafs[leaf - 1] = leaf
      x -= 1
    end

    return i if x.zero?
  end

  return -1
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 6, frog_river_one(5, [1, 3, 1, 4, 2, 3, 5, 4])
  end

  def test_no_jump
    assert_equal -1, frog_river_one(5, [1, 2, 4])
  end

  def test_exact_jump
    assert_equal 0, frog_river_one(1, [1])
  end
end
