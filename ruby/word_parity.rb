require 'test/unit'

class Parity < Test::Unit::TestCase
  CACHE = {
    0 => '0',
    1 => '1',
    2 => '1',
    3 => '0'
  }
  MASK = 0b0011

  def parity(word)
    byte_parity = ''
    byte_word = word.to_i(2)
    while byte_word > 0
      byte_word = byte_word >> 2
      byte_parity += CACHE[byte_word & MASK]
    end
    CACHE[byte_parity.to_i(2)]
  end

  def test_simple
    word = '1000'
    actual = parity(word)
    expected = '1'
    assert(actual == expected, "expected: #{expected}, got: #{actual}")
  end
end


