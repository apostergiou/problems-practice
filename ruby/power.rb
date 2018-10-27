require 'test/unit'

class Power < Test::Unit::TestCase
  def power(x, y)
    result, power = 1.0, y
    power, x = -power, 1.0 / x if y < 0
    while power > 0
      result *= x if power & 1 == 1
      x, power = x * x, power >> 1
    end
    return result
  end

  def test_odd
    actual = power(10, 7)
    expected = 10000000.0
    assert(actual == expected, "expected: #{expected}, got: #{actual}")
  end

  def test_even
    actual = power(10, 8)
    expected = 100000000.0
    assert(actual == expected, "expected: #{expected}, got: #{actual}")
  end

  def test_negative
    actual = power(10, -2).round(3)
    expected = 0.01
    assert(actual == expected, "expected: #{expected}, got: #{actual}")
  end
end

