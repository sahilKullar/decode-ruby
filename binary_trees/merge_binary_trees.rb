require_relative 'binary_tree'

# Time - O(n) where n is the number of the nodes in the smaller tree of the two trees
# Space - O(h) where h is the height of the shorter tree
def merge_binary_trees(tree1, tree2)
  return tree2 if tree1 == nil
  return tree1 if tree2 == nil
  tree1.value += tree2.value
  tree1.left = merge_binary_trees(tree1.left, tree2.left)
  tree1.right = merge_binary_trees(tree1.right, tree2.right)
  tree1
end

tree1 = BinaryTree.new(1)
tree1.left = BinaryTree.new(3)
tree1.left.left = BinaryTree.new(7)
tree1.left.right = BinaryTree.new(4)
tree1.right = BinaryTree.new(2)

tree2 = BinaryTree.new(1)
tree2.left = BinaryTree.new(5)
tree2.left.left = BinaryTree.new(2)
tree2.right = BinaryTree.new(9)
tree2.right.left = BinaryTree.new(7)
tree2.right.right = BinaryTree.new(6)

p merge_binary_trees(tree1, tree2)
