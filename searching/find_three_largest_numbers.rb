# time - O(n)
# space = O(1)

def find_three_largest_numbers(array)
  three_largest = [nil, nil, nil]
  array.each do |num|
    update_largest(three_largest, num)
  end
  three_largest
end

def update_largest(three_largest, num)
  if three_largest[2] == nil || num > three_largest[2]
    shift_and_update(three_largest, 2, num)
  elsif three_largest[1] == nil || num > three_largest[1]
    shift_and_update(three_largest, 1, num)
  elsif three_largest[0] == nil || num > three_largest[0]
    shift_and_update(three_largest, 1, num)
  end
end

def shift_and_update(array, idx, num)
  # 0.upto(idx) do |i|
  (0..idx).each do |i|
    if i == idx
      array[i] = num
    else
      array[i] = array[i + 1]
    end
  end
end

p find_three_largest_numbers([141, 1, 17, -7, -17, -27, 18, 541, 8, 7, 7])