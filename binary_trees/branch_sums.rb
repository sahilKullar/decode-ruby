require_relative './binary_tree'

# Time - O(n)
# Space - O(n)
def branch_sums(root)
  sums = []
  branch_sums_helper(root, 0, sums)
  sums
end

def branch_sums_helper(node, running_sum, sums)
  return unless node
  new_running_sum = running_sum + node.value
  if !node.left && !node.right
    sums << new_running_sum
    return
  end
  branch_sums_helper(node.left, new_running_sum, sums)
  branch_sums_helper(node.right, new_running_sum, sums)
end

tree = BinaryTree.new(1).insert([2, 3, 4, 5, 6, 7, 8, 9, 10])
p branch_sums(tree)
