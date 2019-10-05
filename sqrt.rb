def sqrt(n)
  if n < 0
    return nil
  end
  if n == 1
    return 1
  end
  low = 0
  high = 1 + (n / 2)
  while low + 1 < high do
    mid = (high + low) / 2
    square = mid * mid
    if square == n
      return mid
    elsif square < n
      low = mid
    else
      high = mid
    end
  end

  return low
end

puts sqrt(4)
puts sqrt(9)
puts sqrt(13)
