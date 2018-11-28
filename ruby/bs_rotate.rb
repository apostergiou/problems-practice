require 'minitest/autorun'

def bs_rotate(arr, target)
  pivot = find_pivot(arr, 0, arr.length-1, arr.length/2)
  return true if bs(arr, pivot, arr.length-1, target)
  return true if bs(arr, 0, pivot, target)
  false
end

def find_pivot(arr, left, right, cur)
  if arr[cur-1] > arr[cur] && arr[cur+1] > arr[cur]
    return cur
  end

  if arr[cur-1] < arr[cur] && arr[cur+1] > arr[cur]
    pivot = (cur + left) / 2
    return find_pivot(arr, left, cur, pivot)
  end

  pivot = (cur + right) / 2
  return find_pivot(arr, cur, right, pivot)
end

def bs(arr, left, right, target)
  return true if arr[left] == target
  return if arr[left] == arr[right]

  pivot = (left + right) / 2
  if target > arr[pivot]
    return bs(arr, pivot+1, right, target)
  end

  return bs(arr, left, pivot-1, target)
end

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert bs_rotate([10, 20, 1, 3, 6, 7, 8], 8)
  end
end

