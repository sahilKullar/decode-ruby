# Time - O(n)
# Space - O(n)

def spiral_traverse(array)
  start_row = 0
  end_row = array.length - 1
  start_col = 0
  end_col = array[0].length - 1
  result = []
  while start_row <= end_row && start_col <= end_col

    (start_col..end_col).each do |col|
      result << array[start_row][col]
    end

    ((start_row + 1)..end_row).each do |row|
      result << array[row][end_col]
    end

    (end_col - 1).downto(start_col) do |col|
      result << array[end_row][col]
    end

    (end_row - 1).downto(start_row + 1) do |row|
      result << array[row][start_col]
    end

    start_row += 1
    end_row -= 1
    start_col += 1
    end_col -= 1
  end
  result
end

matrix = [
  [1, 2, 3, 4],
  [12, 13, 14, 5],
  [11, 16, 15, 6],
  [10, 9, 8, 7],
]

p spiral_traverse(matrix)