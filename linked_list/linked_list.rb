class LinkedList
  attr_accessor :value, :next

  def initialize(value)
    self.value = value
    self.next = nil
  end

  def add_many(values)
    current = self
    while current.next != nil
      current = current.next
    end
    values.each do |value|
      current.next = LinkedList.new(value)
      current = current.next
    end
    self
  end

  def get_nodes_in_array
    nodes = []
    current = self
    while current != nil
      nodes << current.value
      current = current.next
    end
    nodes
  end

  def get_nth_node(n)
    counter = 1
    current = self
    while counter < n
      current = current.next
      counter += 1
    end
    current
  end
end