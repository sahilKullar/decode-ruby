require_relative './binary_tree'

# Time - O(n)
# Space - O(d)
def invert_binary_tree(tree)
  return unless tree
  tree.left, tree.right = tree.right, tree.left
  invert_binary_tree(tree.left)
  invert_binary_tree(tree.right)
  tree
end

tree = BinaryTree.new(1).insert([2, 3, 4, 5, 6, 7, 8, 9])
expected = BinaryTree.new(1).inverted_insert([2, 3, 4, 5, 6, 7, 8, 9])
p expected
p invert_binary_tree(tree)
