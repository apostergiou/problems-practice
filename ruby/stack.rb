class Stack
  attr_accessor :count, :storage

  def initialize
    @count = 0
    @storage = {}
  end

  def push(v)
    @storage[@count] = v
    @count += 1
  end

  def pop
    return nil if @count == 0

    @count -= 1
    result = @storage[@count]
    @storage.delete(@count)

    result
  end

  def size
    @count
  end

  def peek
    @storage[@count-1]
  end
end

my_stack = Stack.new
my_stack.push(1)
my_stack.push(2)
puts my_stack.peek
puts my_stack.pop
puts my_stack.peek
my_stack.push("freeCodeCamp")
puts my_stack.size
puts my_stack.peek
puts my_stack.pop
puts my_stack.peek
