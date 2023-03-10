require_relative 'linked_list'

# Time - O(n)
# Space - O(1)
def remove_kth_node_from_end(head, k)
  counter = 1
  first = head
  second = head
  while counter <= k
    second = second.next
    counter += 1
  end

  if second == nil
    head.value = head.next.value
    head.next = head.next.next
    return
  end

  while second.next != nil
    second = second.next
    first = first.next
  end

  first.next = first.next.next
end

test = LinkedList.new(0).add_many([1, 2, 3, 4, 5, 6, 7, 8, 9])
expected = LinkedList.new(0).add_many([1, 2, 3, 4, 5, 7, 8, 9])
remove_kth_node_from_end(test, 4)
p test.get_nodes_in_array
p test.get_nodes_in_array == expected.get_nodes_in_array