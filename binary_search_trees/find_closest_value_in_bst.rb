require_relative './bst'

# Time - O(log(n)) -> Average, O(n) -> Worst
# Space - O(1) -> Average, O(n) -> Worst
def find_closest_value_in_bst(tree, target)
  find_closest_value_in_bst_helper(tree, target, tree.value)
end

def find_closest_value_in_bst_helper(tree, target, closet)
  current_node = tree
  while current_node != nil
    if (target - closet).abs > (target - current_node.value).abs
      closet = current_node.value
    end
    if target < current_node.value
      current_node = current_node.left
    elsif target > current_node.value
      current_node = current_node.right
    else
      break
    end
  end
  closet
end

root = BST.new(10)
root.left = BST.new(5)
root.left.left = BST.new(2)
root.left.left.left = BST.new(1)
root.left.right = BST.new(5)
root.right = BST.new(15)
root.right.left = BST.new(13)
root.right.left.right = BST.new(14)
root.right.right = BST.new(22)

p find_closest_value_in_bst(root, 12)
