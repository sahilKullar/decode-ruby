# Time - O(n)
# Space - O(1)
def kadanes_algorithm(array)
  max_ending_here = array[0]
  max_ending_so_far = array[0]
  (1...array.length).each do |i|
    max_ending_here = [max_ending_here + array[i], array[i]].max
    max_ending_so_far = [max_ending_so_far, max_ending_here].max
  end
  max_ending_so_far
end
p kadanes_algorithm([3, 5, -9, 1, 3, -2, 3, 4, 7, 2, -9, 6, 3, 1, -5, 4])
