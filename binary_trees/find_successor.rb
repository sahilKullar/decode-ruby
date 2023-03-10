require_relative './binary_tree'

# Time - O(n)
# Space - O(n)
def find_successor(tree, node)
  in_order_traversal_order = in_order_traversal(tree)
  (0...in_order_traversal_order.length).each do |i|
    current_node = in_order_traversal_order[i]
    next if node != current_node
    return nil if i == in_order_traversal_order.length - 1
    return in_order_traversal_order[i + 1]
  end
end

def in_order_traversal(tree, order = [])
  return order if tree == nil
  in_order_traversal(tree.left, order)
  order << tree
  in_order_traversal(tree.right, order)
  order
end

root = BinaryTree.new(1)
root.left = BinaryTree.new(2)
root.left.parent = root
root.right = BinaryTree.new(3)
root.right.parent = root
root.left.left = BinaryTree.new(4)
root.left.left.parent = root.left
root.left.right = BinaryTree.new(5)
root.left.right.parent = root.left
root.left.left.left = BinaryTree.new(6)
root.left.left.left.parent = root.left.left
node = root.left.right
expected = root
p expected.value
p "** Should Match **"
p find_successor(root, node).value
