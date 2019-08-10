def balanced_brackets(string)
  opening_brackets = "([{"
  closing_brackets = "}])"
  matching_brackets = {"}" => "{", "]" => "[", ")" => "("}
  stack = []
  string.chars.each do |c|
    if opening_brackets.include?(c)
      stack << c
    elsif closing_brackets.include?(c)
      if stack.length == 0
        return false
      end
      if stack[-1] == matching_brackets[c]
        stack.pop
      else
        return false
      end
    end
  end
  return stack.length == 0
end

puts balanced_brackets("(([{{}}]))") == true
puts balanced_brackets("(([}]))") == false
puts balanced_brackets("(][}]))") == false
