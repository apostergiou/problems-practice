#
# Implement [] accessor
class Enumerator
  def [](index)
    take(index)[index - 1]
  end
end

class Fibonacci
  def initialize
    @fibonacci_generator = Enumerator.new do |yielder|
      x0, x1 = 0, 1

      loop do
        yielder << x0

        x0, x1 = x1, x0 + x1
      end
    end
  end

  def sequence(n)
    @fibonacci_generator.take(n)
  end

  def term(n)
    @fibonacci_generator[n]
  end
end

fibonacci = Fibonacci.new
fibonacci.sequence(10) # => [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
fibonacci.term(10)     # => 34
