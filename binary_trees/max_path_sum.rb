require_relative 'binary_tree'

# Time - O(n)
# Space - O(log(n))
def max_path_sum(tree)
  branch_sum, path_sum = find_max_sum(tree)
  path_sum
end

def find_max_sum(tree)
  return [0, -Float::INFINITY] if tree == nil

  left_max_branch_sum, left_max_path_sum = find_max_sum(tree.left)
  right_max_branch_sum, right_max_path_sum = find_max_sum(tree.right)
  max_child_branch_sum = [left_max_branch_sum, right_max_branch_sum].max

  value = tree.value
  max_branch_sum = [max_child_branch_sum + value, value].max
  max_branch_sum_as_root = [left_max_branch_sum + value + right_max_branch_sum, max_branch_sum].max
  max_path_sum = [left_max_path_sum, right_max_path_sum, max_branch_sum_as_root].max
  [max_branch_sum, max_path_sum]
end

root = BinaryTree.new(1).insert([2, 3, 4, 5, 6, 7])
p max_path_sum(root)
