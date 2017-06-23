##
# Compute the sum of cubes for a given range a through b.
def sum_of_cubes(a, b)
  (a..b).inject(0) { |sum, x| sum += (x * x * x) }
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input_1
    assert_equal 216, sum_of_cubes(3, 5)
  end

  def test_example_input_2
    assert_equal 36, sum_of_cubes(1, 3)
  end
end
