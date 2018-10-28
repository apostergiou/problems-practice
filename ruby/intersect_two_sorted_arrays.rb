def intersect_two_sorted_arrays(a, b)
  i, j, intersection = 0, 0, []
  while i < a.length && j < b.length
    if a[i] == b[j]
      if i == 0 || a[i] != a[i-1]
        intersection << a[i]
      end
      i, j = i + 1, j + 1
    elsif a[i] < b[i]
      i += 1
    else
      j += 1
    end
  end
  return intersection
end
