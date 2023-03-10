require_relative 'linked_list'

# Time - O(n)
# Space - O(1)
def linked_list_palindrome(head)
  slow_node = head
  fast_node = head
  while fast_node != nil && fast_node.next != nil
    slow_node = slow_node.next
    fast_node = fast_node.next.next
  end

  reversed_second_half_node = reverse_the_linked_list(slow_node)
  first_half_head = head

  while reversed_second_half_node != nil
    if reversed_second_half_node.value != first_half_head.value
      return false
    end
    reversed_second_half_node = reversed_second_half_node.next
    first_half_head = first_half_head.next
  end
  true
end


def reverse_the_linked_list(head)
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

head = LinkedList.new(0).add_many([1, 2, 2, 1, 0])
p linked_list_palindrome(head)


