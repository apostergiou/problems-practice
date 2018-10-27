class Node
  attr_accessor :data, :left, :right

  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end

class BST
  attr_accessor :root

  def initialize
    @root = nil
  end

  def add(data)
    node = @root
    if node.nil?
      @root = Node.new(data)
      return
    else
      search_tree = lambda do |node|
        if data < node.data
          if node.left.nil?
            node.left = Node.new(data)
            return
          elsif !node.left.nil?
            search_tree.call(node.left)
          end
        elsif data > node.data
          if node.right.nil?
            node.right = Node.new(data)
            return
          elsif !node.right.nil?
            search_tree.call(node.right)
          end
        else
          return nil
        end
      end
      search_tree.call(node)
    end
  end

  def find_min
    current = @root
    while !current.left.nil?
      current = current.left
    end
    current.data
  end

  def finx_mac
    current = @root
    while !current.right.nil?
      current = current.right
    end
    current.data
  end

  def find(data)
    current = @root
    while current.data != data
      if data < current.data
        current = current.left
      else
        current = current.right
      end
      return nil if current.nil?
    end
    current
  end

  def is_present(data)
    current = @root
    while current
      return true if data == current.data
      if data < current.data
        current = current.left
      else
        current = current.right
      end
    end
    false
  end

  def remove(data)
    remove_node = lambda do |node, data|
      return nil if node.nil?
      if data == node.data
        # node has no children
        if node.left.nil? && node.right.nil?
          return nil
        end
        # node has no left child
        return node.right if node.left.nil?
        # node has no right child
        return node.left if node.right.nil?
        # node has two children
        temp_node = node.right
        while !temp_node.nil?
          temp_node = temp_node.left
        end
        node.data = temp_node.data
        node.right = remove_node.call(node.right, temp_node.data)
        return node
      elsif data < node.data
        node.left = remove_node(node.left, data)
        return node
      else
        node.right = remove_node(node.right, data)
        return node
      end
    end
    @root = remove_node(@root, data)
  end

  def is_balanced
    find_min_height >= find_max_height - 1
  end

  def find_min_height(node = @root)
    return -1 if node.nil?
    left = find_min_height(node.left)
    right = find_min_height(node.right)
    if left < right
      return left + 1
    else
      return right + 1
    end
  end

  def find_max_height(node = @root)
    return -1 if node.nil?
    left = find_max_height(node.left)
    right = find_max_height(node.right)
    if left > right
      return left + 1
    else
      return right + 1
    end
  end

  def in_order
    return nil if @root.nil?
    result = []
    traverse = lambda do |node|
      node.left && traverse.call(node.left)
      result << node.data
      node.right && traverse.call(node.right)
    end
    traverse.call(@root)
    result
  end

  def pre_order
    return nil if @root.nil?
    result = []
    traverse = lambda do |node|
      result << node.data
      node.left && traverse.call(node.left)
      node.right && traverse.call(node.right)
    end
    traverse.call(@root)
    result
  end

  def post_order
    return nil if @root.nil?
    result = []
    traverse = lambda do |node|
      node.left && traverse.call(node.left)
      node.right && traverse.call(node.right)
      result << node.data
    end
    traverse.call(@root)
    result
  end

  def level_order
    result = []
    queue = []
    return nil if @root.nil?
    queue << @root
    while queue.length > 0
      node = queue.shift
      result << node.data
      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end
    result
  end
end

bst = BST.new
bst.add(1)
bst.add(3)
bst.add(0)
bst.add(5)
puts bst.inspect

bst = BST.new
bst.add(9)
bst.add(4)
bst.add(17)
bst.add(3)
bst.add(6)
bst.add(22)
bst.add(5)
bst.add(7)
bst.add(20)

puts bst.find_min_height
puts bst.find_max_height
puts bst.is_balanced
bst.add(10)
puts bst.find_min_height
puts bst.find_max_height
puts bst.is_balanced
puts 'inOrder: ' + bst.in_order.to_s
puts 'preOrder: ' + bst.pre_order.to_s
puts 'postOrder: ' + bst.post_order.to_s
puts 'levelOrder: ' + bst.level_order.to_s
