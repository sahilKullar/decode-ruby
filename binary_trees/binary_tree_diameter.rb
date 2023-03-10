require_relative './binary_tree'

class TreeInfo
  attr_accessor :diameter, :height

  def initialize(diameter, height)
    self.diameter = diameter
    self.height = height
  end
end

def get_tree_info(tree)
  return TreeInfo.new(0, 0) if tree == nil

  left_tree_info = get_tree_info(tree.left)
  right_tree_info = get_tree_info(tree.right)

  longest_path_through_root = left_tree_info.height + right_tree_info.height
  max_diameter = [left_tree_info.diameter, right_tree_info.diameter].max
  current_diameter = [longest_path_through_root, max_diameter].max
  current_height = [left_tree_info.height, right_tree_info.height].max + 1

  TreeInfo.new(current_diameter, current_height)
end

# Time - O(n)
# Space - O(h) when tree in balanced otherwise O(n) means in worst case
def binary_tree_diameter(tree)
  get_tree_info(tree).diameter
end

root = BinaryTree.new(1)
root.left = BinaryTree.new(3)
root.left.left = BinaryTree.new(7)
root.left.left.left = BinaryTree.new(8)
root.left.left.left.left = BinaryTree.new(9)
root.left.right = BinaryTree.new(4)
root.left.right.right = BinaryTree.new(5)
root.left.right.right.right = BinaryTree.new(6)
root.right = BinaryTree.new(2)
# expected = 6
p binary_tree_diameter(root)
