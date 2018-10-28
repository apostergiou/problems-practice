require 'test/unit'

class Binary < Test::Unit::TestCase
  def binary_search(n, arr)
    middle = arr.length / 2
    # lower limit
    i = 0
    # upper limit
    j = arr.length - 1

    while i < j
      if n == arr[middle]
        return true
      elsif n > arr[middle]
        i = middle + 1
        middle = i + j / 2
      else
        j = middle - 1
        middle = i + j / 2
      end
    end
    false
  end

  def test_simple
    expected = true
    actual = binary_search(12, [1,2,3,9,12,23,90,99])
    assert(expected == actual, "expected: #{expected}, got: #{actual}")
  end
end
