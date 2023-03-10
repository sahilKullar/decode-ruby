require_relative 'linked_list'

# Time - O(n)
# Space - O(1)
def reverse_linked_list(head)
  current_node = head
  previous_node = nil
  while current_node != nil
    next_node = current_node.next
    current_node.next = previous_node
    previous_node = current_node
    current_node = next_node
  end
  previous_node
end

test = LinkedList.new(0).add_many([1, 2, 3, 4, 5])
p reverse_linked_list(test).get_nodes_in_array