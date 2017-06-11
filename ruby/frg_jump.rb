# frozen_string_literal: true
# Count minimal number of jumps from position X to Y.
def frg_jump(x, y, d)
  return 0 if x == y
  a, b = (y - x).divmod(d)

  b > 0 ? a + 1 : a
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 3, frg_jump(10, 85, 30)
  end

  def test_no_jump_needed
    assert_equal 0, frg_jump(10, 10, 30)
  end

  def test_exact_jump
    assert_equal 3, frg_jump(0, 90, 30)
  end
end
