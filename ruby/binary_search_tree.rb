class BinarySearchTree
  attr_reader :value, :left_child, :right_child

  def initialize(value)
    @value = value
    @left_child = nil
    @right_child = nil
  end

  def insert_node(value)
    if value <= @value && @left_child
      @left_child.insert_node(value)
    elsif value <= @value
      @left_child = BinarySearchTree.new(value)
    elsif value > @value && @right_child
      @right_child.insert_node(value)
    else
      @right_child = BinarySearchTree.new(value)
    end
  end

  def find_node(value)
    if value < @value && @left_child
      return @left_child.find_node(value)
    end
    if value > @value && @right_child
      return @right_child.find_node(value)
    end

    value == @value
  end

  def remove_node(value, parent)
    if value < @value and @left_child
        return @left_child.remove_node(value, self)
    elsif value < @value
        return false
    elsif value > @value and @right_child
        return @right_child.remove_node(value, self)
    elsif value > @value
        return false
    else
      if @left_child.nil? && @right_child.nil? && self == parent.left_child
        parent.left_child = nil
        @clear_node
      elsif @left_child.nil? && @right_child.nil? && self == parent.right_child
        parent.right_child = nil
        @clear_node
      elsif @left_child && @right_child.nil? && self == parent.left_child
        parent.left_child = @left_child
        @clear_node
      elsif @left_child && @right_child.nil? && self == parent.right_child
        parent.right_child = @left_child
        @clear_node
      elsif @right_child && @left_child.nil? && self == parent.left_child
        parent.left_child = @right_child
        @clear_node
      elsif @right_child && @left_child.nil? && self == parent.right_child
        parent.right_child = @right_child
        @clear_node
      else
        @value = @right_child.find_minimum_value
        @right_child.remove_node(@value, self)
      end
      return true
    end
  end

  def clear_node
    @value = nil
    @left_child = nil
    @right_child = nil
  end

  def find_minimum_value
    @left_child ? @left_child.find_minimum_value : @value
  end
end

#        |15|
#      /      \
#    |11|     |30|
#   /    \    /   \
# |6|   |12| |29| |35|
#           \
#          |15|
bst = BinarySearchTree.new(15)
bst.insert_node(11)
bst.insert_node(6)
bst.insert_node(12)
bst.insert_node(30)
bst.insert_node(15)
bst.insert_node(35)
bst.insert_node(29)

puts("##########")
puts("Find node:")
puts("##########")
puts "15: " + bst.find_node(15).to_s # True
puts "10: " + bst.find_node(10).to_s # False
puts "29: " + bst.find_node(29).to_s # True
