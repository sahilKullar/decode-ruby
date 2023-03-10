# Time - O(n)
# Space - O(1)

def min_number_of_jumps(array)
  return 0 if array.length == 1
  jumps = 0
  steps = array[0]
  max_reach = array[0]
  (1...array.length - 1).each do |i|
    max_reach = [max_reach, array[i] + i].max
    steps -= 1
    if steps == 0
      jumps += 1
      steps = max_reach - i
    end
  end
  jumps + 1
end

p min_number_of_jumps([3, 4, 2, 1, 2, 3, 7, 1, 1, 1, 3])
