require_relative './binary_tree'

class TreeInfo
  attr_accessor :is_balanced, :height

  def initialize(is_balanced, height)
    self.is_balanced = is_balanced
    self.height = height
  end
end

# Time - O(n)
# Space - O(h)
def height_balanced_binary_tree(tree)
  get_tree_info(tree).is_balanced
end

def get_tree_info(tree)
  return TreeInfo.new(true, -1) if tree == nil

  left_tree_info = get_tree_info(tree.left)
  right_tree_info = get_tree_info(tree.right)

  is_balanced = left_tree_info.is_balanced && right_tree_info.is_balanced && (left_tree_info.height - right_tree_info.height).abs <= 1
  current_height = [left_tree_info.height, right_tree_info.height].max + 1
  TreeInfo.new(is_balanced, current_height)
end

root = BinaryTree.new(1)
root.left = BinaryTree.new(2)
root.right = BinaryTree.new(3)
root.left.left = BinaryTree.new(4)
root.left.right = BinaryTree.new(5)
root.right.right = BinaryTree.new(6)
root.left.right.left = BinaryTree.new(7)
root.left.right.right = BinaryTree.new(8)
# expected = true
p height_balanced_binary_tree(root)
