##
# Given an array, return true if all the elements are Fixnums.
def array_of_fixnums?(array)
  array.all? { |e| e.is_a? Fixnum }
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input_1
    assert_equal true, array_of_fixnums?([1, 2, 3])
  end

  def test_example_input_2
    assert_equal false, array_of_fixnums?(['a', 1])
  end
end
