require_relative 'linked_list'

# Time - O(n)
# Space - O(1)
def shift_linked_list(head, k)
  list_tail = head
  list_tail_length = 1
  while list_tail.next != nil
    list_tail = list_tail.next
    list_tail_length += 1
  end

  offset = k.abs % list_tail_length
  return head if offset == 0

  new_tail_length = k > 0 ? list_tail_length - offset : offset
  new_tail = head
  (1...new_tail_length).each do |_|
    new_tail = new_tail.next
  end

  new_head = new_tail.next
  new_tail.next = nil
  list_tail.next = head

  new_head
end

head = LinkedList.new(0).add_many([1, 2, 3, 4, 5])
p shift_linked_list(head, 2).get_nodes_in_array