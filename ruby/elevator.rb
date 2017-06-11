# frozen_string_literal: true
def elevator(a, b, m, x, y)
  trip = 0
  passengers_weight = 0
  lifts = []

  a.each_with_index do |weight, i|
    unless lifts[trip].nil?
      if lifts[trip].size == x || passengers_weight + weight > y
        trip += 1
        passengers_weight = 0
      end
    end

    lifts[trip] = lifts[trip] || []
    lifts[trip] << b[i]
    passengers_weight += weight
  end

  lifts.map { |floors| floors.uniq.size + 1 }.inject(:+)
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 5, elevator([60, 80, 40], [2, 3, 5], 5, 2, 200)
  end

  def test_example_input_2
    assert_equal 6, elevator([40, 40, 100, 80, 20], [3, 3, 2, 2, 3], 3, 5, 200)
  end

  def test_example_input_3
    assert_equal 4, elevator([200, 200], [1, 1], 1, 5, 200)
  end

  def test_example_input_4
    assert_equal 2, elevator([200], [1], 1, 5, 200)
  end
end
