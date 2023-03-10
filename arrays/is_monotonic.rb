# Time - O(n)
# Space - O(1)

def is_monotonic(array)
  is_non_decreasing = true
  is_non_increasing = true
  (1...array.length).each do |i|
    is_non_decreasing = false if array[i] < array[i - 1]
    is_non_increasing = false if array[i] > array[i - 1]
  end
  is_non_decreasing || is_non_increasing
end

p is_monotonic([-1, -5, -10, -1100, -1100, -1101, -1102, -9001])