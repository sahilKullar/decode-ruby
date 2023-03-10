# Time - O(V + E)
# Space - O(V)
def cycle_in_graph(edges)
  num_of_nodes = edges.length
  visited = Array.new(num_of_nodes, false)
  currently_in_stack = Array.new(num_of_nodes, false)
  (0...num_of_nodes).each do |node|
    next if visited[node]
    contains_cycle = is_node_in_cycle(node, visited, currently_in_stack, edges)
    return true if contains_cycle
  end
  false
end

def is_node_in_cycle(node, visited, currently_in_stack, edges)
  visited[node] = true
  currently_in_stack[node] = true
  neighbours = edges[node]
  neighbours.each do |neighbour|
    if !visited[neighbour]
      contains_cycle = is_node_in_cycle(neighbour, visited, currently_in_stack, edges)
      return true if contains_cycle
    elsif currently_in_stack[neighbour]
      return true
    end
  end
  currently_in_stack[node] = false
  false
end

p cycle_in_graph([[1, 3], [2, 3, 4], [0], [], [2, 5], []]) # true
p cycle_in_graph([[1, 2], [2], []]) # false
