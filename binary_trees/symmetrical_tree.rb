require_relative 'binary_tree'

# Time - O(n) where n is the number of nodes in the tree
# Space - O(h) where h is the height of the tree
def symmetrical_tree(tree)
  trees_are_mirrored(tree.left, tree.right)
end

def trees_are_mirrored(left, right)
  if left != nil && right != nil && left.value == right.value
    return trees_are_mirrored(left.left, right.right) && trees_are_mirrored(left.right, right.left)
  end
  left == right
end

tree = BinaryTree.new(6)
tree.left = BinaryTree.new(5)
tree.right = BinaryTree.new(5)
tree.left.left = BinaryTree.new(7)
tree.left.right = BinaryTree.new(9)
tree.right.left = BinaryTree.new(9)
tree.right.right = BinaryTree.new(7)
p symmetrical_tree(tree)
