# Time - O(wh)
# Space - O(wh)
def river_sizes(matrix)
  sizes = []
  visited = matrix.map { |row| row.map { |col| false } }
  (0...matrix.length).each do |i|
    (0...matrix[i].length).each do |j|
      next if visited[i][j]
      traverse_node(i, j, matrix, visited, sizes)
    end
  end
  sizes
end

def traverse_node(i, j, matrix, visited, sizes)
  current_river_sizes = 0
  node_to_explore = [[i, j]]
  while node_to_explore.length > 0
    # current_node = node_to_explore.pop
    # i = current_node[0]
    # j = current_node[1]
    i, j = node_to_explore.pop
    next if visited[i][j]
    visited[i][j] = true
    next if matrix[i][j] == 0
    current_river_sizes += 1
    unvisited_neighbours = get_unvisited_neighbours(i, j, matrix, visited)
    unvisited_neighbours.each do |neighbour|
      node_to_explore << neighbour
    end
  end
  sizes << current_river_sizes if current_river_sizes > 0
end

def get_unvisited_neighbours(i, j, matrix, visited)
  unvisited_neighbours = []
  unvisited_neighbours << [i - 1, j] if i > 0 && !visited[i - 1][j]
  unvisited_neighbours << [i + 1, j] if i < matrix.length - 1 && !visited[i + 1][j]
  unvisited_neighbours << [i, j - 1] if j > 0 && !visited[i][j - 1]
  unvisited_neighbours << [i, j + 1] if j < matrix[0].length - 1 && !visited[i][j + 1]
  unvisited_neighbours
end

test_input = [
  [1, 0, 0, 1, 0],
  [1, 0, 1, 0, 0],
  [0, 0, 1, 0, 1],
  [1, 0, 1, 0, 1],
  [1, 0, 1, 1, 0],
]

p river_sizes(test_input).sort
