class BinaryTree
  attr_reader :value, :left_child, :right_child

  def initialize(value)
    @value = value
    @left_child = nil
    @right_child = nil
  end

  def insert_left(value)
    if @left_child.nil?
      @left_child = BinaryTree.new(value)
    else
      new_node = BinaryTree.new(value)
      new_node.left_child = @left_child
      @left_child = new_node
    end
  end

  def insert_right(value)
    if @right_child.nil?
      @right_child = BinaryTree.new(value)
    else
      new_node = BinaryTree.new(value)
      new_node.right_child = @right_child
      @right_child = new_node
    end
  end

  def pre_order
    puts @value
    @left_child.pre_order if @left_child
    @right_child.pre_order if @right_child
  end

  def in_order
    @left_child.in_order if @left_child
    puts @value
    @right_child.in_order if @right_child
  end

  def post_order
    @left_child.post_order if @left_child
    @right_child.post_order if @right_child
    puts @value
  end

  def bfs
    queue = []
    queue.push(self)

    while !queue.empty?
      current_node = queue.pop

      puts current_node.value

      queue.push(current_node.left_child) if current_node.left_child
      queue.push(current_node.right_child) if current_node.right_child
    end
  end
end

puts "##########"
puts "Printing the tree"
puts "##########"
a_node = BinaryTree.new('a')
a_node.insert_left('b')
a_node.insert_right('c')

b_node = a_node.left_child
b_node.insert_right('d')

c_node = a_node.right_child
c_node.insert_left('e')
c_node.insert_right('f')

d_node = b_node.right_child
e_node = c_node.left_child
f_node = c_node.right_child

puts a_node.value # a
puts b_node.value # b
puts c_node.value # c
puts d_node.value # d
puts e_node.value # e
puts f_node.value # f

puts "##########"
puts "Printing pre-order, in-order, post-order and bfs traversal"
puts "##########"
puts "pre-order:"
a_node.pre_order
puts "in-order:"
a_node.in_order
puts "post-order:"
a_node.post_order
puts "bfs:"
a_node.bfs
