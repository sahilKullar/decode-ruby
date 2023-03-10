# Time - O(nlog(n) + mlog(m))
# Space - O(1)

def smallest_difference(array_one, array_two)
  array_one.sort! { |a, b| a - b }
  array_two.sort! { |a, b| a - b }
  current = Float::INFINITY
  smallest = Float::INFINITY
  smallest_pair = []
  idx_one = 0
  idx_two = 0
  while idx_one < array_one.length && idx_two < array_two.length
    first_num = array_one[idx_one]
    second_num = array_two[idx_two]
    if first_num < second_num
      current = second_num - first_num
      idx_one += 1
    elsif first_num > second_num
      current = first_num - second_num
      idx_two += 1
    else
      return [first_num, second_num]
    end
    if current < smallest
      smallest = current
      smallest_pair = [first_num, second_num]
    end
  end
  smallest_pair
end

p smallest_difference([-1, 5, 10, 20, 28, 3], [26, 134, 135, 15, 17])