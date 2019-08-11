def solution(a, b, c)
  # max = [""]
  solution_helper(a, b, c, "")
  # return max[0]
end

def solution_helper(a, b, c, string)
  if string[-3, string.length] == "aaa" ||
      string[-3, string.length] == "bbb" ||
      string[-3, string.length] == "ccc"
    return ""
  end

  if a < 0 || b < 0 || c < 0
    return ""
  end

  # if string.length > max.length
  #   max = string
  # end

  # if a > 0
  # puts string
  [
    string,
    solution_helper(a - 1, b, c, string + "a"),
    solution_helper(a, b - 1, c, string + "b"),
    solution_helper(a, b, c - 1, string + "c")
  ].max { |t1, t2| t1.length <=> t2.length }
  # end

  # if b > 0

  # end

  # if c > 0
  # end
end

puts solution(6, 1, 1)
puts solution(1, 3, 1)
puts solution(0, 1, 8)
