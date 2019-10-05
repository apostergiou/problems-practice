def anagrams(s1, s2)
  s1 = s1.downcase
  s2 = s2.downcase
  if s1.length != s2.length
    return false
  end

  letters = fill_table(s1.chars)

  s2.chars.each do |c|
    if letters[c] == nil || letters[c] == 0
      return false
    else
      letters[c] -= 1
    end
  end

  return true
end

def fill_table(s)
  table = {}
  s.each do |c|
    table[c] = table[c].nil? ? 1 : table[c] + 1
  end

  return table
end

puts anagrams("Eleven plus two", "Twelve plus one")
puts anagrams("Elevena plus two", "Twelve plus one")
