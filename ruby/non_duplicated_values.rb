##
# Given an Array, return the elements that are present exactly once in the array.
def non_duplicated_values(values)
  uniq_hash = {}
  values.each do |v|
    uniq_hash[v] = uniq_hash[v].nil? ? true : false
  end

  uniq_hash.select { |_, v| v == true }.keys
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input_1
    assert_equal [1, 4, 5], non_duplicated_values([1, 2, 2, 3, 3, 4, 5])
  end

  def test_example_input_2
    assert_equal [1, 3], non_duplicated_values([1, 2, 2, 3, 4, 4])
  end
end
