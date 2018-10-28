def dutch_flag_partition(pivot_idx, arr)
  pivot = arr[pivot_idx]

  smaller = 0
  (0...arr.length).each do |i|
    if arr[i] < pivot
      arr[i], arr[smaller] = arr[smaller], arr[i]
      smaller += 1
    end
  end

  larger = arr.length - 1
  (arr.length-1).downto(0).each do |i|
    if arr[i] > pivot
      arr[i], arr[larger] = arr[larger], arr[i]
      larger -= 1
    end
  end
  return arr
end

array = [1,2,0,-1,9]
puts "array: #{array}"
puts "pivot: #{array[2]}"
puts "result: #{dutch_flag_partition(2, [1,2,0,-1,9])}"
