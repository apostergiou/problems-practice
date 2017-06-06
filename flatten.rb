def flatten_array(array, init = [])
  array.each do |a|
    if a.class.is_a? Array
      flatten_array(a, init)
    else
      init << a
    end
  end
  init
end

require "minitest/autorun"

class Tests < MiniTest::Unit::TestCase
  def test_example_1
    assert_equal [1, 2, 3, 4, 5, 6, 5, 6],
                 flatten_array([1, 2, [3], [4, [5, 6], 5, 6]])
  end
end
