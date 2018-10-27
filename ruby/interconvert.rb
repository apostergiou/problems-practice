require 'test/unit'

class Interconvert < Test::Unit::TestCase
  def string_to_int(s)
  end

  def int_to_string(x)
    is_negative = false
    x, is_negative = -x, true if x < 0

    s = []
    while true
      s << ('0'.ord + x % 10).chr
      x /= 10
      break if x == 0
    end
    if is_negative
      return '-' + s.reverse.join('')
    else
      return '' + s.reverse.join('')
    end
  end

  def string_to_int(s)
    fac = 1
    s.chars.reverse_each.reduce(0) do |tot, digit|
      tot += (digit.ord - 48) * fac
      fac *= 10
      tot
    end
  end

  def test_string_to_int
    actual = string_to_int('1234')
    expected = 1234
    assert(actual == expected, "expected: #{expected}, got: #{actual}")
  end

  def test_int_to_string
    actual = int_to_string(1234)
    expected = '1234'
    assert(actual == expected, "expected: #{expected}, got: #{actual}")
  end
end

