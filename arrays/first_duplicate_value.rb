# require 'set'
# Time = O(n)
# Space = O(n)
# def first_duplicate_value(array)
#   seen = Set.new
#   array.each do |value|
#     return value if seen.include?(value)
#     seen << value
#   end
#   -1
# end

# Time - O(n)
# Space - O(1)
def first_duplicate_value(array)
  array.each do |value|
    abs_value = value.abs
    return abs_value if array[abs_value - 1] < 0
    array[abs_value - 1] *= -1
  end
  -1
end

p first_duplicate_value([2, 1, 5, 2, 3, 3, 4])