class Node
  attr_accessor :name, :children

  def initialize(name)
    self.name = name
    self.children = []
  end

  def add_child(name)
    self.children << Node.new(name)
    self
  end

  # Time - O(V + E)
  # Space - O(V)
  def breadth_first_search(array)
    queue = [self]
    while queue.length > 0
      current = queue.shift
      array << current.name
      current.children.each do |child|
        queue << child
      end
    end
    array
  end
end

graph = Node.new("A")
graph.add_child("B").add_child("C").add_child("D")
graph.children[0].add_child("E").add_child("F")
graph.children[2].add_child("G").add_child("H")
graph.children[0].children[1].add_child("I").add_child("J")
graph.children[2].children[0].add_child("K")
# ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K'])
p graph.breadth_first_search([])
