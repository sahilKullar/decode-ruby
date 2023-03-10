require_relative 'linked_list'

# Time - O(n + m)
# Space - O(1)
def merge_linked_list(head_one, head_two)
  p1 = head_one
  p2 = head_two
  p1_prev = nil
  while p1 != nil && p2 != nil
    if p1.value < p2.value
      p1_prev = p1
      p1 = p1.next
    else
      p1_prev.next = p2 if p1_prev != nil
      p1_prev = p2
      p2 = p2.next
      p1_prev.next = p1
    end
  end
  p1_prev.next = p2 if p1 == nil
  head_one.value < head_two.value ? head_one : head_two
end

list1 = LinkedList.new(2).add_many([6, 7, 8])
list2 = LinkedList.new(1).add_many([3, 4, 5, 9, 10])
# p merge_linked_list(list1, list2)
p merge_linked_list(list1, list2).get_nodes_in_array
# expectedNodes = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
