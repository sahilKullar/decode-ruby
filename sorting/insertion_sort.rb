# time - O(n ^ 2)
# space - O(1)

def insertion_sort(array)
  (array.length).times do |i|
    j = i
    while j > 0 && array[j] < array[j - 1]
      array[j], array[j - 1] = array[j - 1], array[j]
      j -= 1
    end
  end
  array
end

print insertion_sort([9, 30, 2, 88, 3, 98, 45])