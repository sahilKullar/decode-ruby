# Time - O(wh)
# Space - O(wh)
def remove_islands(matrix)
  ones_connected_to_border = matrix.map { |row| row.map { |col| false } }

  (0...matrix.length).each do |row|
    (0...matrix[row].length).each do |col|
      row_is_border = row == 0 || row == matrix.length - 1
      col_is_border = col == 0 || col == matrix[row].length - 1
      is_border = row_is_border || col_is_border
      next unless is_border
      next if matrix[row][col] == 0
      find_ones_connected_to_border(row, col, matrix, ones_connected_to_border)
    end
  end

  (1...matrix.length - 1).each do |row|
    (1...matrix[row].length - 1).each do |col|
      next if ones_connected_to_border[row][col]
      matrix[row][col] = 0
    end
  end
  matrix
end

def find_ones_connected_to_border(startRow, startCol, matrix, ones_connected_to_border)
  stack = [[startRow, startCol]]
  while stack.length > 0
    row, col = stack.pop
    next if ones_connected_to_border[row][col]
    ones_connected_to_border[row][col] = true
    next if matrix[row][col] == 0
    neighbours = get_neighbours(row, col, matrix)
    neighbours.each do |neighbour|
      stack << neighbour
    end
  end
end

def get_neighbours(row, col, matrix)
  neighbours = []
  neighbours << [row - 1, col] if row > 0
  neighbours << [row + 1, col] if row < matrix.length - 1
  neighbours << [row, col - 1] if col > 0
  neighbours << [row, col + 1] if col < matrix[0].length - 1
  neighbours
end

input = [
  [1, 0, 0, 0, 0, 0],
  [0, 1, 0, 1, 1, 1],
  [0, 0, 1, 0, 1, 0],
  [1, 1, 0, 0, 1, 0],
  [1, 0, 1, 1, 0, 0],
  [1, 0, 0, 0, 0, 1],
]

expected = [
  [1, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 1, 1],
  [0, 0, 0, 0, 1, 0],
  [1, 1, 0, 0, 1, 0],
  [1, 0, 0, 0, 0, 0],
  [1, 0, 0, 0, 0, 1],
]

p remove_islands(input) == expected
