# frozen_string_literal: true
# Calculate the values of counters after applying all alternating operations:
# increase counter by 1;
# set value of all counters to current maximum.
def max_counters(n, a)
  counters = {}
  (1..n).step do |i|
    counters[i] = { value: 0, max_counter: 0 }
  end
  max = 0
  max_counter = 0

  a.each do |x|
    if x <= n
      if counters[x][:max_counter] == max_counter
        counters[x][:value] += 1
      else
        counters[x][:value] = max_counter + 1
        counters[x][:max_counter] = max_counter
      end
      max = counters[x][:value] if counters[x][:value] > max
    else
      max_counter = max
    end
  end

  counters.values.map do |s|
    s[:max_counter] == max_counter ? s[:value] : max_counter
  end
end


require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal [3, 2, 2, 4, 2], max_counters(5, [3, 4, 4, 6, 1, 4, 4])
  end

  def test_one_increment
    assert_equal [1, 0], max_counters(2, [1])
  end

  def test_empty
    assert_equal [0, 0], max_counters(2, [])
  end

  def test_one_maximize
    assert_equal [0, 0], max_counters(2, [6])
  end

  def test_one_increment_and_maximize
    assert_equal [1, 1], max_counters(2, [1, 6])
  end
end
