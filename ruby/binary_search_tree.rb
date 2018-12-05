class Node
  attr_accessor :key, :left, :right

  def initialize(key)
    @key = key
    @left = nil
    @right = nil
  end
end


def inorder(root)
  return if root.nil?
  inorder(root.left)
  puts root.key
  inorder(root.right)
end


def insert(node, key)
  return Node.new(key) if node.nil?

  if key < node.key
    node.left = insert(node.left, key)
  else
    node.right = insert(node.right, key)
  end

  return node
end

# Given a non-empty binary search tree, return the node
# with min key value found in that tree. Note that the
# entire tree does not need to be searched
def min_value_node(node)
  current = node

  # loop down to find the leftmost leaf
  while(!current.left.nil?)
    current = current.left
  end

  return current
end

# Given a binary search tree and a key, this function
# delete the key and returns the new root
def delete_node(root, key)
  return root if root.nil?

  # If the key to be deleted is smaller than the root's
  # key then it lies in  left subtree
  if key < root.key
    root.left = delete_node(root.left, key)

    # If the key to be delete is greater than the root's key
    # then it lies in right subtree
  elsif(key > root.key)
    root.right = delete_node(root.right, key)

    # If key is same as root's key, then this is the node
    # to be deleted
  else
    # Node with only one child or no child
    if root.left.nil?
      temp = root.right
      root = nil
      return temp
    elsif root.right.nil?
      temp = root.left
      root = nil
      return temp
    end

    # Node with two children: Get the inorder successor
    # (smallest in the right subtree)
    temp = min_value_node(root.right)

    # Copy the inorder successor's content to this node
    root.key = temp.key

    # Delete the inorder successor
    root.right = delete_node(root.right , temp.key)
  end

  return root
end

# Driver program to test above functions
#            50
#         /     \
#        30      70
#       /  \    /  \
#     20   40  60   80

root = nil
root = insert(root, 50)
root = insert(root, 30)
root = insert(root, 20)
root = insert(root, 40)
root = insert(root, 70)
root = insert(root, 60)
root = insert(root, 80)

puts "Inorder traversal of the given tree"
inorder(root)

puts "\nDelete 20"
root = delete_node(root, 20)
puts "Inorder traversal of the modified tree"
inorder(root)

puts "\nDelete 30"
root = delete_node(root, 30)
puts "Inorder traversal of the modified tree"
inorder(root)

puts "\nDelete 50"
root = delete_node(root, 50)
puts "Inorder traversal of the modified tree"
inorder(root)
