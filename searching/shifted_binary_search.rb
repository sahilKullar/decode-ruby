# Time = O(log(n))
# Space = O(1)

def shifted_binary_search(array, target)
  shifted_binary_search_helper(array, target, 0, array.length - 1)
end

def shifted_binary_search_helper(array, target, left, right)
  while left <= right
    middle = ((left + right) / 2).floor
    potential_match = array[middle]
    if target == potential_match
      return middle
    elsif array[left] <= potential_match
      if target < potential_match && target >= array[left]
        right = middle - 1
      else
        left = middle + 1
      end
    else
      if target > potential_match && target <= array[right]
        left = middle + 1
      else
        right = middle - 1
      end
    end
  end
  -1
end

p shifted_binary_search([45, 61, 71, 72, 73, 0, 1, 21, 33, 37], 33)
p shifted_binary_search([61, 71, 72, 73, 0, 1, 21, 33, 37], 33)