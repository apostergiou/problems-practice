def delete_nth(order,max_e)
  h = {}
  final_array = []
  order.each do |n|
    h[n] = 1
  end
  order.each do |n|
    if h[n] <= max_e
      h[n] += 1
      final_array << n
    end
  end
  final_array
end

require 'minitest/autorun'

class Tests < MiniTest::Test
  def test_example_1
    assert_equal [20,37,21], delete_nth([20,37,20,21], 1)
    assert_equal [1, 1, 3, 3, 7, 2, 2, 2], delete_nth([1,1,3,3,7,2,2,2,2], 3)
  end
end
