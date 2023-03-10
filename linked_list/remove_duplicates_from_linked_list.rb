require_relative 'linked_list'

# Time - O(n)
# Space - O(1)
def remove_duplicates_from_linked_list(linked_list)
  current_node = linked_list
  while current_node != nil
    next_distinct_node = current_node.next
    while next_distinct_node != nil && next_distinct_node.value == current_node.value
      next_distinct_node = next_distinct_node.next
    end
    current_node.next = next_distinct_node
    current_node = next_distinct_node
  end
  linked_list
end

input = LinkedList.new(1).add_many([1, 3, 4, 4, 4, 5, 6, 6])
expected = LinkedList.new(1).add_many([3, 4, 5, 6])
p remove_duplicates_from_linked_list(input).get_nodes_in_array
p remove_duplicates_from_linked_list(input).get_nodes_in_array == expected.get_nodes_in_array
