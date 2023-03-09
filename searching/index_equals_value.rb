# Time - O(n)
# Space - O(1)
def index_equals_value(array)
  array.length.times.each do |i|
    return i if array[i] == i
  end
  -1
end

# Time = O(log(n))
# Space = O(1)
# def index_equals_value(array)
#   left_idx = 0
#   right_idx = array.length - 1
#   while left_idx <= right_idx
#     middle_idx = ((left_idx + right_idx) / 2).floor
#     middle_value = array[middle_idx]
#     if middle_value < middle_idx
#       left_idx = middle_idx + 1
#     elsif middle_value == middle_idx && middle_idx == 0
#       return middle_idx
#     elsif middle_value == middle_idx && array[middle_idx - 1] < middle_idx - 1
#       return middle_idx
#     else
#       right_idx = middle_idx - 1
#     end
#   end
#   -1
# end

p index_equals_value([-5, -3, 0, 3, 4, 5, 9])
p index_equals_value([-5, -3, 0])
