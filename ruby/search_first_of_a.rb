require 'test/unit'

class Search < Test::Unit::TestCase
  def search_first_of_k(arr, k)
    left, right, result = 0, arr.length - 1, -1
    while left <= right
      mid = (left + right) / 2
      if arr[mid] > k
        right = mid - 1
      elsif arr[mid] == k
        result = mid
        right = mid - 1
      else
        left = mid + 1
      end
    end
    return result
  end

  def test_repeated
    array = [-14, 10, 2, 108, 108, 243, 285, 285, 285, 401]
    k = 108
    expected = 3
    actual = search_first_of_k(array, k)
    assert(expected == actual, "expected: #{expected}, got: #{actual}")
  end
end
