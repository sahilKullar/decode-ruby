require_relative 'linked_list'

# Time - O(n)
# Space - O(1)
def find_loop(head)
  first = head.next
  second = head.next.next

  while first != second
    first = first.next
    second = second.next.next
  end

  first = head
  while first != second
    first = first.next
    second = second.next
  end

  first
end

test = LinkedList.new(0).add_many([1, 2, 3, 4, 5, 6, 7, 8, 9])
test.get_nth_node(10).next = test.get_nth_node(5)
# chai.expect(program.findLoop(test)).to.deep.equal(test.getNthNode(5))
p find_loop(test)
p find_loop(test).value