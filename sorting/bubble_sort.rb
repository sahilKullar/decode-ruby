# time - O(n ^ 2)
# space - O(1)

def bubble_sort(array)
  swapped = false
  counter = 0
  until swapped
    swapped = true
    (array.length - 1 - counter).times do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        swapped = false
      end
    end
    counter += 1
  end
  array
end

print bubble_sort([9, 30, 2, 88, 3, 98, 45])
