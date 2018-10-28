class Stack
  class MaxWithCount
    attr_accessor :max, :count

    def initialize(max, count)
      @max, @count = max, count
    end
  end

  def initialize
    @element = []
    @cached_max_with_count = []
  end

  def empty
    @element.length == 0
  end

  def max
    raise Error('max: empty stack') if empty
    @cached_with_count[-1].max
  end

  def pop
    raise Error('pop: empty stack') if empty
    pop_element = @element.pop
    @current_max = cached_max_with_count[-1].max
    if pop_element == current_max
      @cached_max_with_count[-1].count -= 1
      if @cached_max_with_count[-1].count == 0
        @cached_max_with_count.pop
      end
    end
    return pop_element
  end

  def push(x)
    @element << x
    if @cached_max_with_count.length == 0
      @cached_max_with_count << MaxWithCount.new(x, 1)
    else
      current_max = @cached_max_with_count[-1].max
      if x == current_max
        @cached_max_with_count[-1] += 1
      elsif x > current_max
        @cached_max_with_count << MaxWithCount(x, 1)
    end
  end
end
