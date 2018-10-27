require 'test/unit'

class Reverse < Test::Unit::TestCase
  def reverse(x)
    result, x_remaining = 0, x.abs
    while x_remaining > 0
      result = result * 10 + x_remaining % 10
      x_remaining /= 10
    end
    x < 0 ? -result : result
  end

  def test_positive
    actual = reverse(1132)
    expected = 2311
    assert(actual == expected, "expected: #{expected}, got: #{actual}")
  end

  def test_negative
    actual = reverse(-1132)
    expected = -2311
    assert(actual == expected, "expected: #{expected}, got: #{actual}")
  end
end

