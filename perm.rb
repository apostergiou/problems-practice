def perm(s)
  if s.length == 1
    return [s]
  end

  perms = perm(s[1..-1])
  char = s[0]
  result = []
  perms.each do |word|
    (0..word.length+1).each do |i|
      result << word[0...i] + char + word[i..word.length].to_s
    end
  end
  return result
end

puts perm("cat")
