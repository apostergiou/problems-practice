# Sort hash keys by string length
def sort_h(h)
  h.keys.map(&:to_s).sort_by(&:length)
end

require 'minitest/autorun'

class TestMeme < MiniTest::Unit::TestCase
  def test_me
    assert_equal(["a", "56", "key"], sort_h({ key: :hello, 56 => 3, a: 1991 }))
  end
end
