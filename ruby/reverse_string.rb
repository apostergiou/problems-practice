require 'test/unit'

class ReverseString < Test::Unit::TestCase
  def reverse_it(s)
    reversed = []
    chars = s.chars
    l = chars.length

    ((l-1).downto(0)).each do |i|
      reversed << chars[i]
    end
    reversed.join('')
  end

  def reverse_rec(s)
    rec = lambda do |chars|
      return chars.first if chars.length < 2
      rec.call(chars[1..-1]) + chars[0]
    end
    rec.call(s.chars)
  end

  def test_it
    actual = reverse_it('abc')
    expected = 'cba'
    assert(actual == expected, "expected: #{expected}, got: #{actual}")
  end

  def test_rec
    actual = reverse_rec('abc')
    expected = 'cba'
    assert(actual == expected, "expected: #{expected}, got: #{actual}")
  end
end
