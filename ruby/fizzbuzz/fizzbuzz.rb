def fb_calc(i)
  case 0
  when i % 15
    'FizzBuzz'
  when i % 3
    'Fizz'
  when i % 5
    'Buzz'
  else
    i.to_s
  end
end

def fizzbuzz(n)
  (1..Float::INFINITY).lazy.map(&:fb_calc).first(n)
end
