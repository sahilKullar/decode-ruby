class Node
  attr_accessor :value, :prev, :next

  def initialize(value)
    self.value = value
    self.next = nil
    self.prev = nil
  end
end

class DoublyLinkedList
  attr_accessor :head, :tail

  def initialize
    self.head = nil
    self.tail = nil
  end

  def set_head(node)
    if self.head == nil
      self.head = node
      self.tail = node
      return
    end
    self.insert_before(self.head, node)
  end

  def set_tail(node)
    if self.tail == nil
      self.set_head(node)
      return
    end
    self.insert_after(self.tail, node)
  end

  def insert_before(node, node_to_insert)
    return if node_to_insert == self.head && node_to_insert == self.tail
    self.remove(node_to_insert)
    node_to_insert.prev = node.prev
    node_to_insert.next = node
    if node.prev == nil
      self.head = node_to_insert
    else
      node.prev.next = node_to_insert
    end
    node.prev = node_to_insert
  end

  def insert_after(node, node_to_insert)
    return if node_to_insert == self.head && node_to_insert == self.tail
    self.remove(node_to_insert)
    node_to_insert.prev = node
    node_to_insert.next = node.next
    if node.next == nil
      self.tail = node_to_insert
    else
      node.next.prev = node_to_insert
    end
    node.next = node_to_insert
  end

  def insert_at_position(position, node_to_insert)
    if position == 1
      self.set_head(node_to_insert)
      return
    end
    node = self.head
    current_position = 1
    while node != nil && current_position != position
      node = node.next
      current_position += 1
    end
    if node != nil
      self.insert_before(node, node_to_insert)
    else
      self.set_tail(node_to_insert)
    end

  end

  def remove_nodes_with_value(value)
    node = self.head
    while node != nil
      node_to_remove = node
      node = node.next
      if node_to_remove.value == value
        self.remove(node_to_remove)
      end
    end
  end

  def remove(node)
    self.head = self.head.next if self.head == node
    self.tail = self.tail.prev if self.tail == node
    self.remove_node_bindings(node)
  end

  # order of the lines inside the method is very important otherwise will lose track
  def remove_node_bindings(node)
    node.prev.next = node.next if node.prev != nil
    node.next.prev = node.prev if node.next != nil
    node.prev = nil
    node.next = nil
  end

  def contains_node_with_value(value)
    node = self.head
    node = node.next while node != nil && node.value != value
    node != nil
  end

  def remove_tail
    return if self.tail === nil
    if self.tail === self.head
      self.head = nil
      self.tail = nil
      return
    end
    self.tail = self.tail.prev
    self.tail.next = nil
  end
end

def bind_nodes(node_one, node_two)
  node_one.next = node_two
  node_two.prev = node_one
end

def get_node_values_head_to_tail(linked_list)
  values = []
  node = linked_list.head
  while node != nil
    values << node.value
    node = node.next
  end
  values
end

def get_node_values_tail_to_head(linked_list)
  values = []
  node = linked_list.tail
  while node != nil
    values << node.value
    node = node.prev
  end
  values
end

=begin
linked_list = DoublyLinkedList.new
one = Node.new(1)
two = Node.new(2)
three = Node.new(3)
three2 = Node.new(3)
three3 = Node.new(3)
four = Node.new(4)
five = Node.new(5)
six = Node.new(6)
bind_nodes(one, two)
bind_nodes(two, three)
bind_nodes(three, four)
bind_nodes(four, five)
linked_list.head = one
linked_list.tail = five

linked_list.set_head(four)
# chai.expect(get_node_values_head_to_tail(linked_list)).to.deep.equal([4, 1, 2, 3, 5])
# chai.expect(get_node_values_tail_to_head(linked_list)).to.deep.equal([5, 3, 2, 1, 4])
p get_node_values_head_to_tail(linked_list)
p get_node_values_tail_to_head(linked_list)

linked_list.set_tail(six)
# chai.expect(get_node_values_head_to_tail(linked_list)).to.deep.equal([4, 1, 2, 3, 5, 6])
# chai.expect(get_node_values_tail_to_head(linked_list)).to.deep.equal([6, 5, 3, 2, 1, 4])
p get_node_values_head_to_tail(linked_list)
p get_node_values_tail_to_head(linked_list)

linked_list.insert_before(six, three)
# chai.expect(get_node_values_head_to_tail(linked_list)).to.deep.equal([4, 1, 2, 5, 3, 6])
# chai.expect(get_node_values_tail_to_head(linked_list)).to.deep.equal([6, 3, 5, 2, 1, 4])
p get_node_values_head_to_tail(linked_list)
p get_node_values_tail_to_head(linked_list)

linked_list.insert_after(six, three2)
# chai.expect(get_node_values_head_to_tail(linked_list)).to.deep.equal([4, 1, 2, 5, 3, 6, 3])
# chai.expect(get_node_values_tail_to_head(linked_list)).to.deep.equal([3, 6, 3, 5, 2, 1, 4])
p get_node_values_head_to_tail(linked_list)
p get_node_values_tail_to_head(linked_list)

linked_list.insert_at_position(1, three3)
# chai.expect(get_node_values_head_to_tail(linked_list)).to.deep.equal([3, 4, 1, 2, 5, 3, 6, 3])
# chai.expect(get_node_values_tail_to_head(linked_list)).to.deep.equal([3, 6, 3, 5, 2, 1, 4, 3])
p get_node_values_head_to_tail(linked_list)
p get_node_values_tail_to_head(linked_list)

linked_list.remove_nodes_with_value(3)
# chai.expect(get_node_values_head_to_tail(linked_list)).to.deep.equal([4, 1, 2, 5, 6])
# chai.expect(get_node_values_tail_to_head(linked_list)).to.deep.equal([6, 5, 2, 1, 4])
p get_node_values_head_to_tail(linked_list)
p get_node_values_tail_to_head(linked_list)

linked_list.remove(two)
# chai.expect(get_node_values_head_to_tail(linked_list)).to.deep.equal([4, 1, 5, 6])
# chai.expect(get_node_values_tail_to_head(linked_list)).to.deep.equal([6, 5, 1, 4])
p get_node_values_head_to_tail(linked_list)
p get_node_values_tail_to_head(linked_list)

# chai.expect(linked_list.containsNodeWithValue(5)).to.deep.equal(true)
p linked_list.contains_node_with_value(5)
=end
