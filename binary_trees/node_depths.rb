require_relative './binary_tree'

# Time - O(n)
# Space - O(h) h is the height of the tree
def node_depths(root, depth = 0)
  return 0 unless root # root == nil
  depth + node_depths(root.left, depth + 1) + node_depths(root.right, depth + 1)
end

root = BinaryTree.new(1)
root.left = BinaryTree.new(2)
root.left.left = BinaryTree.new(4)
root.left.left.left = BinaryTree.new(8)
root.left.left.right = BinaryTree.new(9)
root.left.right = BinaryTree.new(5)
root.right = BinaryTree.new(3)
root.right.left = BinaryTree.new(6)
root.right.right = BinaryTree.new(7)
p node_depths(root)
