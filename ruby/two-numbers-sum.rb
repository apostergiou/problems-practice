def test1(array, target_sum)
  array.sort!
  left = 0
  right = array.length - 1

  while left < right do
    current_sum = array[left] + array[right]
    if current_sum == target_sum
      return [array[left], array[right]]
    elsif current_sum < target_sum
      left += 1
    else
      right -= 1
    end
  end
  return []
end

def test2(array, target_sum)
  nums = {}
  array.each do |num|
    potential_match = target_sum - num
    if nums[potential_match] != nil
      return [potential_match, num].sort!
    else
      nums[num] = true
    end
  end
  return []
end

input1 = [3, 5, -4, 8, 11, 1, -1, 6]
input2 = 10
output = [-1, 11]
puts test1(input1, input2) == output
puts test2(input1, input2) == output
