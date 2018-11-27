def string_perm(s)
  if s.length == 0
    puts ''
  end
  if s.length == 1
    puts s
  end
  perm_helper(s, 0, s.length-1)
end

def perm_helper(s, start_idx, end_idx)
  if start_idx == end_idx
    puts s
    return
  end

  (start_idx..end_idx).each do |i|
    s[start_idx], s[i] = s[i], s[start_idx]
    perm_helper(s, start_idx+1, end_idx)
    s[start_idx], s[i] = s[i], s[start_idx]
  end
end

string_perm('abcd')
